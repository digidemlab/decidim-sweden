# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = "0.21.0"

gem "decidim", git: "https://github.com/decidim/decidim", branch: '0.21-stable'

#gem "decidim-initiatives", DECIDIM_VERSION

gem "decidim-term_customizer", git: "https://github.com/digidemlab/decidim-module-term_customizer"
#gem "decidim-access_requests", git: "https://github.com/mainio/decidim-module-access_requests"
gem "decidim-navbar_links", git: "https://github.com/digidemlab/decidim-module-navbar_links"
gem "decidim-socio_demographic_authorization_handler", git: "https://github.com/digidemlab/decidim-module-socio_demographic_authorization_handler"

gem "bootsnap", "~> 1.3"

gem "wicked_pdf"

gem "puma", "~> 4.3"
gem "uglifier", "~> 4.1"

gem "faker", "~> 1.9"

gem "figaro"

gem "sentry-raven"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "decidim-dev", git: "https://github.com/decidim/decidim", branch: '0.21-stable'
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
  gem "sinatra"
  gem "decidim-antivirus", git: "https://github.com/digidemlab/decidim-module-antivirus"
end
