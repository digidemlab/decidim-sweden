# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = { git: "https://github.com/digidemlab/decidim", branch: "0.23-with-map-improvement-from-OSP" }

gem "decidim", DECIDIM_VERSION
gem "decidim-consultations", DECIDIM_VERSION

gem "decidim-term_customizer", git: "https://github.com/tremend-cofe/decidim-module-term_customizer", branch: "0.24-dev"
#gem "decidim-access_requests", git: "https://github.com/mainio/decidim-module-access_requests"
gem "decidim-navbar_links", git: "https://github.com/OpenSourcePolitics/decidim-module-navbar_links", ref: "master"
gem "decidim-socio_demographic_authorization_handler", git: "https://github.com/digidemlab/decidim-module-socio_demographic_authorization_handler", branch: "just-age-and-gender"
#gem "decidim-jitsi_meetings", git: "https://github.com/digidemlab/decidim-module-online-meetings"
gem "decidim-decidim_awesome", git: "https://github.com/digidemlab/decidim-module-decidim_awesome"
#gem "decidim-plans", git: "https://github.com/mainio/decidim-module-plans", branch: "develop"
#gem "decidim-ideas", git: "https://github.com/mainio/decidim-module-ideas", branch: "master"
#gem "decidim-favorites", git: "https://github.com/mainio/decidim-module-favorites", branch: "master"
#gem "decidim-feedback", git: "https://github.com/mainio/decidim-module-feedback", branch: "master"
#gem "decidim-accountability_simple", git: "https://github.com/mainio/decidim-module-accountability_simple", branch: "develop"
#gem "decidim-budgets_enhanced", git: "https://github.com/OpenSourcePolitics/decidim-module-budgets_enhanced", ref: "0.22-dev"

gem "decidim-analytics", git: "https://github.com/digidemlab/decidim-module-analytics"

gem "bootsnap", "~> 1.3"

gem "wicked_pdf"

gem "puma", "~> 4.3"
gem "uglifier", "~> 4.1"

gem "faker", "~> 1.9"

gem "figaro"

gem "sentry-rails"
gem "sentry-sidekiq"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "decidim-dev", DECIDIM_VERSION
end

group :development do
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 3.5"
end

group :production do
  gem "passenger"
  gem "sidekiq"
  gem "sidekiq-scheduler"
  gem "sinatra"
  gem "decidim-antivirus", git: "https://github.com/digidemlab/decidim-module-antivirus", branch: "master"
end
