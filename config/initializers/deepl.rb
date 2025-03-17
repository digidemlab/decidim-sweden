# frozen_string_literal: true

if Gem.loaded_specs['deepl-rb'].version > Gem::Version.new('3.2.0')
  raise "Remove this monkey patch if https://github.com/DeepLcom/deepl-rb/issues/6 is fixed in this version! Otherwise, bump the checked version here."
else
  # Fixes "FrozenError: can't modify frozen OpenSSL::SSL::SSLContext" at
  # the expense of performance. https://github.com/DeepLcom/deepl-rb/issues/6
  DeepL::API.prepend(Module.new do
    def http_client
      Thread.current[:deepl_api_http_client_copy] ||= @http_client.dup
    end
  end)
end

# DeepL Translation service configuration
DeepL.configure do |config|
  config.auth_key = Rails.application.secrets.translator[:api_key]
  config.host = Rails.application.secrets.translator[:host]
end
