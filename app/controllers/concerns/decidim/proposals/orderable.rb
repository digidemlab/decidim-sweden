# frozen_string_literal: true

require "active_support/concern"

module Decidim
  module Proposals
    # Common logic to ordering resources
    module Orderable
      extend ActiveSupport::Concern

      included do
        include Decidim::Orderable

        private

        # Available orders based on enabled settings
        def available_orders
          @available_orders ||= [default_order] + possible_orders.excluding(default_order)
        end

        def possible_orders
          @possible_orders ||= begin
            possible_orders = %w(random recent)
            possible_orders << "score" if graded_vote?
            possible_orders << "most_voted" if most_voted_order_available?
            possible_orders << "most_endorsed" if current_settings.endorsements_enabled?
            possible_orders << "most_commented" if component_settings.comments_enabled?
            possible_orders << "most_followed" << "with_more_authors"
            possible_orders
          end
        end

        def default_order
          @default_order ||= fetch_default_order
        end

        def fetch_default_order
          default_order = current_settings.default_sort_order.presence || component_settings.default_sort_order
          return order_by_default if default_order == "automatic"

          possible_orders.include?(default_order) ? default_order : order_by_default
        end

        def order_by_default
          if graded_vote?
            "score"
          elsif order_by_votes?
            "most_voted"
          else
            "random"
          end
        end

        def most_voted_order_available?
          current_settings.votes_enabled? && !current_settings.votes_hidden?
        end

        def order_by_votes?
          most_voted_order_available? && current_settings.votes_blocked?
        end

        def graded_vote?
          component_settings.awesome_voting_manifest == "graded_vote"
        end

        def order_by_score
            vote_score_sql = <<~SQL.squish
              (
                SELECT COALESCE(SUM(decidim_awesome_vote_weights.weight), 0)
                FROM decidim_proposals_proposal_votes v
                  LEFT JOIN decidim_awesome_vote_weights ON v.id = decidim_awesome_vote_weights.proposal_vote_id
                  WHERE v.decidim_proposal_id = decidim_proposals_proposals.id
              )
            SQL
            Arel.sql("#{vote_score_sql} DESC")
        end

        def reorder(proposals)
          case order
          when "score"
            proposals.order(order_by_score)
          when "most_commented"
            proposals.order(comments_count: :desc)
          when "most_endorsed"
            proposals.order(endorsements_count: :desc)
          when "most_followed"
            proposals.order(follows_count: :desc)
          when "most_voted"
            proposals.order(proposal_votes_count: :desc)
          when "random"
            proposals.order_randomly(random_seed)
          when "recent"
            proposals.order(published_at: :desc)
          when "with_more_authors"
            proposals.order(coauthorships_count: :desc)
          end
        end
      end
    end
  end
end
