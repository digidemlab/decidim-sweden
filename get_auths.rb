#
# Export contact info
# RAILS_ENV=production ../.rbenv/shims/rails runner get_auths.rb > ../kontaktuppgifter.csv
#
#  puts "#{process.slug};#{auth.decidim_user_id};#{user.nickname};#{user.email};#{auth.metadata["phone_number"]}"
# puts "process;proposal_id;proposal_reference;proposal_title;user_id;user_nickname;user_email;user_phone"
Decidim::ParticipatoryProcess.all.each do |proc|
  Decidim::Component.where("participatory_space_id = ? and manifest_name = 'proposals'", proc.id).each do |comp|
    Decidim::Proposals::Proposal.where("decidim_component_id = ?", comp.id).sort_by(&:id).each do |prop|
      Decidim::Coauthorship.where("coauthorable_type = 'Decidim::Proposals::Proposal' and coauthorable_id = ?", prop.id).each do |coauth|
        user = Decidim::User.find_by(id: coauth[:decidim_author_id])
        auth = Decidim::Authorization.find_by(decidim_user_id: user[:id])
        phone = auth.nil? ? "" : auth.metadata["phone_number"]
        title = ( prop["title"]["sv"] || prop["title"]["en"] ).strip
        puts "#{proc.slug};#{prop.id};#{title};#{user.id};#{user.nickname};#{user.email};#{phone}"
      end
    end
  end
end
