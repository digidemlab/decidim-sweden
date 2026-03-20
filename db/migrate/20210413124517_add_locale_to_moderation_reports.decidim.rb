# frozen_string_literal: true

# This migration comes from decidim (originally 20201019074554)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-17 21:26:02 UTC
class AddLocaleToModerationReports < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_reports, :locale, :string
  end
end
