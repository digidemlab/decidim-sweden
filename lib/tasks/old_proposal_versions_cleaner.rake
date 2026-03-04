# frozen_string_literal: true

namespace :decidim_proposals do
  desc "Remove old versions of proposals"
  task clean: :environment do
    logger = Logger.new($stdout)
    old_versions = PaperTrail::Version.where(item_type: "Decidim::Proposals::Proposal")
    logger.info "Removing #{old_versions.count} proposal versions"
    old_versions.destroy_all
  end
end
