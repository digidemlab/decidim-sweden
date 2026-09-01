require_relative 'boot'

require 'decidim/rails'
# Add the frameworks used by your app that are not loaded by Decidim.
require 'action_cable/engine'
# require "action_mailbox/engine"
# require "action_text/engine"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DecidimSweden
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.proposals_keep_revisions = []
    
    config.to_prepare do
      Decidim::Proposals::ProposalSerializer.include(ProposalSerializerExtensions)
    end

    initializer "customizations", after: "decidim_core.action_controller" do
      config.to_prepare do
        Decidim::Proposals::ApplicationController.include(ProposalsApplicationControllerExtensions)
        Decidim::Proposals::CollaborativeDraftsController.include(CollaborativeDraftsControllerExtensions)
      end
    end

  end
end
