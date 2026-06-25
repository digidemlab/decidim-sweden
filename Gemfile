# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = { git: "https://github.com/decidim/decidim", branch: "release/0.30-stable" }

gem "decidim", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-templates", DECIDIM_VERSION
gem "decidim-initiatives", DECIDIM_VERSION

gem "decidim-verifications-simple_impersonation", git: "https://github.com/digidemlab/decidim-verifications-simple_impersonation"

gem "decidim-decidim_awesome", "~>0.13.0"

gem "bootsnap", "~> 1.3"
gem "wicked_pdf"
gem "puma", ">= 6.3.1"
gem "faker", "~> 3.2"
gem "figaro"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "decidim-dev", DECIDIM_VERSION
end

group :development do
  gem "letter_opener_web", "~> 2.0"
  gem "listen", "~> 3.1"
  gem "web-console", "~> 3.5"
end

group :production do
  gem "passenger"
  gem "sidekiq", "~> 6.5.8"
  gem "sidekiq-scheduler"
  gem "sidekiq-failures"
  gem "sinatra"
end

gem "nokogiri", "~> 1.16"

gem "mini_portile2", "~> 2.8"

gem "deepl-rb", require: "deepl"
