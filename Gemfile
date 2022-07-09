# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = { git: "https://github.com/decidim/decidim", branch: "release/0.25-stable" }

gem "decidim", DECIDIM_VERSION
gem "decidim-consultations", DECIDIM_VERSION

gem "decidim-term_customizer", git: "https://github.com/mainio/decidim-module-term_customizer", branch: "release/0.25-stable"
#gem "decidim-socio_demographic_authorization_handler", git: "https://github.com/digidemlab/decidim-module-socio_demographic_authorization_handler", branch: "just-age-and-gender"
gem "decidim-decidim_awesome", git: "https://github.com/Platoniq/decidim-module-decidim_awesome", branch: "main"
gem "decidim-simple_proposal", git: "https://github.com/mainio/decidim-module-simple_proposal", branch: "release/0.25-stable"
#gem "decidim-accountability_simple", git: "https://github.com/mainio/decidim-module-accountability_simple", branch: "develop"
gem "decidim-extra_user_fields", git: "https://github.com/digidemlab/decidim-module-extra_user_fields", branch: "release/0.25-stable"

gem "decidim-analytics", git: "https://github.com/digidemlab/decidim-module-analytics"
gem "decidim-faceless", git: "https://github.com/digidemlab/decidim-module-faceless", branch: "release/0.25-stable"

gem "bootsnap", "~> 1.3"

gem "wicked_pdf"

gem "puma", ">= 5.0.0"

gem "faker", "~> 2.14"

gem "figaro"

gem "nokogiri", "1.13.4"

gem "sentry-ruby"
gem "sentry-rails"
gem "sentry-sidekiq"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "decidim-dev", DECIDIM_VERSION
end

group :development do
  gem "letter_opener_web", "~> 2.0"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 3.5"
end

group :production do
  gem "passenger"
  gem "sidekiq"
  gem "sidekiq-scheduler"
  gem "sidekiq-failures"
  gem "sinatra"
  gem "decidim-antivirus", git: "https://github.com/mainio/decidim-module-antivirus", branch: "release/0.25-stable"
end
