# frozen_string_literal: true

namespace :withdrawn_proposals_cleaner do
  desc "Remove withdrawn proposals"
  task clean: :environment do
    logger = Logger.new($stdout)
    logger.info("Removing withdrawn proposals...")
    Decidim::Proposals::Proposal.where.not(withdrawn_at: nil).each do |proposal|
      logger.info "Removing proposal with id #{proposal.id}, withdrawn at #{proposal.withdrawn_at}." if proposal.destroy
    rescue StandardError => e
      logger.error "Error removing proposal with id #{proposal.id}, withdrawn at #{proposal.withdrawn_at}."
    end
  end
end
