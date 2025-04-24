# frozen_string_literal: true

Decidim.menu :mobile_menu do |menu|
  Decidim::ParticipatoryProcess.published.active.each do |process|
    menu_id = "process_#{process.slug}"
    menu.add_item menu_id,
                  process.title[I18n.locale.to_s],
                  "/processes/#{process.slug}"
    menu.move menu_id, after: :participatory_processes
  end
end
