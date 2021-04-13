# frozen_string_literal: true

if Rails.application.secrets.dig(:sentry, :enabled)
  Rails.application.config.rails_activesupport_breadcrumbs = true

  Sentry.init do |config|
    config.dsn = Rails.application.secrets.dig(:sentry, :dsn)
    config.transport.timeout = 10
    config.transport.open_timeout = 10
    config.breadcrumbs_logger = [:active_support_logger, :sentry_logger]
  end
end
