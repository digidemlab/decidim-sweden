# frozen_string_literal: true

# This migration comes from decidim (originally 20180115090038)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-09 01:14:17 UTC
class ExtendUserProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_users, :personal_url, :string
    add_column :decidim_users, :about, :text
  end
end
