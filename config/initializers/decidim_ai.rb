# See https://docs.decidim.org/en/v0.30/services/aitools

Decidim::Ai::SpamDetection.resource_score_threshold = 0.75 # default

Decidim::Ai::SpamDetection.resource_analyzers = [
  {
    name: :bayes,
    strategy: Decidim::Ai::SpamDetection::Strategy::Bayes,
    options: {
      adapter: ENV.fetch("DECIDIM_SPAM_DETECTION_BACKEND_RESOURCE", "redis"),
      params: { url: ENV.fetch("DECIDIM_SPAM_DETECTION_BACKEND_RESOURCE_REDIS_URL", "redis://localhost:6379/2") }
    }
  }
]

Decidim::Ai::SpamDetection.reporting_user_email = "your-admin@example.org"

Decidim::Ai::SpamDetection.resource_models = {
  # "Decidim::Comments::Comment" => "Decidim::Ai::SpamDetection::Resource::Comment",
  # "Decidim::Initiative" => "Decidim::Ai::SpamDetection::Resource::Initiative",
  # "Decidim::Debates::Debate" => "Decidim::Ai::SpamDetection::Resource::Debate",
  # "Decidim::Meetings::Meeting" => "Decidim::Ai::SpamDetection::Resource::Meeting",
  # "Decidim::Proposals::Proposal" => "Decidim::Ai::SpamDetection::Resource::Proposal",
  # "Decidim::Proposals::CollaborativeDraft" => "Decidim::Ai::SpamDetection::Resource::CollaborativeDraft",
  # "Decidim::UserGroup" => "Decidim::Ai::SpamDetection::Resource::UserBaseEntity",
  "Decidim::User" => "Decidim::Ai::SpamDetection::Resource::UserBaseEntity"
}

Decidim::Ai::SpamDetection.user_score_threshold = 0.75 # default

Decidim::Ai::SpamDetection.user_analyzers = [
  {
    name: :bayes,
    strategy: Decidim::Ai::SpamDetection::Strategy::Bayes,
    options: {
      adapter: ENV.fetch("DECIDIM_SPAM_DETECTION_BACKEND_USER", "redis"),
      params: { url: ENV.fetch("DECIDIM_SPAM_DETECTION_BACKEND_USER_REDIS_URL", "redis://localhost:6379/3") }
    }
  }
]

Decidim::Ai::SpamDetection.user_models = {
  "Decidim::UserGroup" => "Decidim::Ai::SpamDetection::Resource::UserBaseEntity",
  "Decidim::User" => "Decidim::Ai::SpamDetection::Resource::UserBaseEntity"
}

Decidim::Ai::SpamDetection.user_detection_service = "Decidim::Ai::SpamDetection::Service"
