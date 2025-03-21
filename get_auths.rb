#
# Export contact info 
# RAILS_ENV=production ../.rbenv/shims/rails runner get_auths.rb > ../kontaktuppgifter.csv
#
Decidim::Authorization.all.each do |auth|
  user = Decidim::User.find_by(id: auth.decidim_user_id)
  space = auth.metadata["participatory_space"]
  next unless space
  process_id = space.split("/")[-1]
  process = Decidim::ParticipatoryProcess.find_by(id: process_id)
  puts "#{process.slug};#{auth.decidim_user_id};#{user.nickname};#{user.email};#{auth.metadata["phone_number"]}"
end
