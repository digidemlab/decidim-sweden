Decidim.configure do |config|
  config.omniauth_providers = {
    facebook: {
      enabled: ENV["OMNIAUTH_FACEBOOK_APP_ID"].present?,
      app_id: ENV["OMNIAUTH_FACEBOOK_APP_ID"],
      app_secret: ENV["OMNIAUTH_FACEBOOK_APP_SECRET"]
    },
    twitter: {
      enabled: ENV["OMNIAUTH_TWITTER_API_KEY"].present?,
      api_key: ENV["OMNIAUTH_TWITTER_API_KEY"],
      api_secret: ENV["OMNIAUTH_TWITTER_API_SECRET"]
    },
    google_oauth2: {
      enabled: ENV["OMNIAUTH_GOOGLE_CLIENT_ID"].present?,
      client_id: ENV["OMNIAUTH_GOOGLE_CLIENT_ID"],
      client_secret: ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"]
    },
    gbgip: {
      enabled: ENV["GBGIP_ENABLED"].presence == "true",
      icon: "login-box-line"
    },
  }
end
