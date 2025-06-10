# frozen_string_literal: true

require "cell/partial"

module Decidim
  # Topics and their corresponding pages are mapped out to the footer
  # of the layout.
  #
  #  Example:
  #
  #   cell("decidim/footer_links", nil)
  #
  class FooterLinksCell < Decidim::ViewModel
    def show
      return if topics.blank?

      render
    end

    private

    def topics
      @topics ||= current_organization.static_page_topics.where(show_in_footer: true).map do |topic|
        next if topic.pages.empty?

        {
          title: decidim_escape_translated(topic.title),
          pages: topic.pages
        }
      end.compact
    end

    def page_item(page, opts = {})
      title = decidim_escape_translated(page.title)
      path = decidim.page_path(page)
      content_tag(:li, **opts.slice(:class)) do
        link_to title, path
      end
    end
  end
end
