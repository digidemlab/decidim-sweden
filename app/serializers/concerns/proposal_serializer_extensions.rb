# frozen_string_literal: true

require "active_support/concern"

module ProposalSerializerExtensions
  extend ActiveSupport::Concern

  included do
    def author_fields
      is_author_user_group = resource.coauthorships.map(&:decidim_user_group_id).any?

      {
        id: resource.authors.map(&:id),
        name: resource.authors.map do |author|
          author_name(is_author_user_group ? resource.coauthorships.first.user_group : author)
        end,
        url: resource.authors.map do |author|
          author_url(is_author_user_group ? resource.coauthorships.first.user_group : author)
        end,
        email: resource.authors.map do |author|
          author_email(author)
        end,
        phone: resource.authors.map do |author|
          author_phone(author)
        end,
        reason: resource.authors.map do |author|
          author_reason(author)
        end
      }
    end
  end

  def author_email(author)
    if author.respond_to?(:email)
      author.email
    else
      ""
    end
  end

  def author_phone(author)
    if author.respond_to?(:phone_number)
      author.phone_number
    else
      ""
    end
  end

  def author_reason(author)
    if author.managed?
      Decidim::ImpersonationLog.where(decidim_user_id: author.id)&.filter {|l| l.reason != ""}.map(&:reason).join(", ") || ""
    else
      ""
    end
  end
end
