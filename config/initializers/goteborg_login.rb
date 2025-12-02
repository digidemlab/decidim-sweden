# frozen_string_literal: true

saml_path = Rails.application.root.join("config", "saml")
cert_path = Rails.application.root.join("config", "saml", "cert")


# FIXME: This check shouldn't be disabled but I don't know how to fix it
#
# If you get this error  'HTTP Origin header (https://authpubatest.goteborg.se) didn't match request.base_url (https://goteborg.stage.demokratiskastader.se)'
# you need to disable CSRF(?) checks,
#
# In config/environments/production.rb add the following row
#
#   config.action_controller.allow_forgery_protection = false

Decidim::GoteborgLogin::Gbgpub.configure do |config|
  Rails.logger.warn "initializers/goteborg_login.rb : Gbgpub"
  config.sp_entity_id = "https://medborgarinflytande.goteborg.se/idppub/saml20"
  config.assertion_consumer_service_url = "https://medborgarinflytande.goteborg.se/users/auth/gbgpub/callback"
  config.idp_metadata_file = "#{saml_path}/goteborg_prod_idppub_medborgare_federation_metadata.xml"
  config.certificate_file = "#{cert_path}/gbg_sp_decidim_prod_v2.crt"
  config.private_key_file = "#{cert_path}/gbg_sp_decidim_prod_v2.key"
end

Decidim::GoteborgLogin::Gbgip.configure do |config|
  Rails.logger.warn "initializers/goteborg_login.rb : Gbgpub"
  config.sp_entity_id = "https://medborgarinflytande.goteborg.se/ip/saml20"
  config.assertion_consumer_service_url = "https://medborgarinflytande.goteborg.se/users/auth/gbgip/callback"
  config.idp_metadata_file = "#{saml_path}/goteborg_prod_ip_federation_staden_anvandare_metadata.xml"
  config.certificate_file = "#{cert_path}/gbg_sp_decidim_prod_v2.crt"
  config.private_key_file = "#{cert_path}/gbg_sp_decidim_prod_v2.key"
end

# NOTE: The Localidp configuration need to be here but it's never used in a production environment 
# Just copied necessary config from Gbgpub
Decidim::GoteborgLogin::Localidp.configure do |config|
  config.idp_metadata_file = "#{saml_path}/goteborg_prod_idppub_medborgare_federation_metadata.xml"
end
