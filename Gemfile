# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = { git: "https://github.com/decidim/decidim", ref: "64da356" }

gem "decidim", DECIDIM_VERSION
gem "decidim-templates", DECIDIM_VERSION
gem "decidim-initiatives", DECIDIM_VERSION

gem "decidim-budgets_paper_ballots", git: "https://github.com/digidemlab/decidim-module-budgets_paper_ballots", branch: "master"
gem "decidim-term_customizer", git: "https://github.com/digidemlab/decidim-module-term_customizer.git", branch: "master"
gem "decidim-decidim_awesome", "0.12.3"
gem "decidim-smsauth", git: "https://github.com/digidemlab/decidim-module-smsauth", branch: "main"
gem "decidim-sms-infobip", git: "https://github.com/digidemlab/decidim-sms-infobip", branch: "main"

### Awaiting upgrade to version 0.28 ###

# NOTE(d1): https://github.com/decidim-ice/decidim-module-decidim_awesome/issues/324

# NOTE(pj): needs some improvements
#gem "decidim-faceless", git: "https://github.com/digidemlab/decidim-module-faceless", branch: "release/0.28-beta"


### Additional Decidim Modules ###

# NOTE(d1): disabled, does not support v0.29.x
# gem "decidim-term_customizer", git: "https://github.com/mainio/decidim-module-term_customizer", branch: "main"

# gem "decidim-accountability_simple", git: "https://github.com/mainio/decidim-module-accountability_simple", branch: "develop"

gem "decidim-socio_demographic_authorization_handler", git: "https://github.com/digidemlab/decidim-module-socio_demographic_authorization_handler", branch: "goteborg-0.29"

# gem "decidim-simple_proposal", git: "https://github.com/mainio/decidim-module-simple_proposal", branch: "main"

# gem "decidim-analytics", git: "https://github.com/digidemlab/decidim-module-analytics"


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
  # NOTE(d1): disabled, does not support v0.29.x
  # gem "decidim-antivirus", git: "https://github.com/mainio/decidim-module-antivirus", branch: "main"
end

gem "nokogiri", "~> 1.16"

gem "mini_portile2", "~> 2.8"
