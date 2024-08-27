# frozen_string_literal: true

Decidim.configure do |config|
  config.application_name = Rails.application.secrets.application_name
  config.mailer_sender = Rails.application.secrets.mailer_sender

  # Change these lines to set your preferred locales
  config.default_locale = :en
  config.available_locales = %i[sv en]

  # Geocoder configuration
  config.maps = {
    provider: :here,
    api_key: Rails.application.secrets.geocoder[:here_api_key],
    static: {
      url: "https://image.maps.ls.hereapi.com/mia/1.6/mapview"
    },
    autocomplete: {
      address_format: ["name", %w(street houseNumber), "city"]
    }
  }

  # Custom resource reference generator method
  # config.reference_generator = lambda do |resource, component|
  #   # Implement your custom method to generate resources references
  #   "1234-#{resource.id}"
  # end

  # Currency unit
  config.currency_unit = 'kr'

  # Allow participants to use the platform for 2 days before confirming their e-mail address
  config.unconfirmed_access_for = 2.days

  # The number of reports which an object can receive before hiding it
  # config.max_reports_before_hiding = 3

  # Custom HTML Header snippets
  #
  # The most common use is to integrate third-party services that require some
  # extra JavaScript or CSS. Also, you can use it to add extra meta tags to the
  # HTML. Note that this will only be rendered in public pages, not in the admin
  # section.
  #
  # Before enabling this you should ensure that any tracking that might be done
  # is in accordance with the rules and regulations that apply to your
  # environment and usage scenarios. This component also comes with the risk
  # that an organization's administrator injects malicious scripts to spy on or
  # take over user accounts.
  #
  config.enable_html_header_snippets = false

  # SMS gateway configuration
  #
  # If you want to verify your users by sending a verification code via
  # SMS you need to provide a SMS gateway service class.
  #
  # An example class would be something like:
  #
  # class MySMSGatewayService
  #   attr_reader :mobile_phone_number, :code
  #
  #   def initialize(mobile_phone_number, code)
  #     @mobile_phone_number = mobile_phone_number
  #     @code = code
  #   end
  #
  #   def deliver_code
  #     # Actual code to deliver the code
  #     true
  #   end
  # end
  #
  # config.sms_gateway_service = "MySMSGatewayService"

  # Etherpad configuration
  #
  # Only needed if you want to have Etherpad integration with Decidim. See
  # Decidim docs at docs/services/etherpad.md in order to set it up.
  #
  # config.etherpad = {
  #   server: Rails.application.secrets.etherpad[:server],
  #   api_key: Rails.application.secrets.etherpad[:api_key],
  #   api_version: Rails.application.secrets.etherpad[:api_version]
  # }

  config.expire_session_after = ENV.fetch("DECIDIM_SESSION_TIMEOUT", 1440).to_i.minutes

  config.social_share_services = Rails.application.secrets.decidim[:social_share_services]

  # Custom setting to avoid Retry later error
  config.throttling_max_requests = 1000

end

Rails.application.config.i18n.available_locales = Decidim.available_locales
Rails.application.config.i18n.default_locale = Decidim.default_locale

# Inform Decidim about the assets folder
Decidim.register_assets_path File.expand_path("app/packs", Rails.application.root)

if Decidim.module_installed? :verifications
  Decidim::Verifications.configure do |config|
    config.document_types = Rails.application.secrets.dig(:verifications, :document_types).presence || %w(identification_number passport)
  end
end
