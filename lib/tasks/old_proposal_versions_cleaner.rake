# frozen_string_literal: true

namespace :decidim_proposals do
  desc 'Remove old versions of proposals'
  task clean: :environment do
    logger = Logger.new($stdout)
    keep_ids = Rails.application.config.proposals_keep_revisions
    old_versions = PaperTrail::Version.where(item_type: 'Decidim::Proposals::Proposal')
    old_versions = old_versions.where.not(item_id: keep_ids) if keep_ids.present?
    logger.info "Removing #{old_versions.count} proposal versions"
    old_versions.destroy_all
  end
end
