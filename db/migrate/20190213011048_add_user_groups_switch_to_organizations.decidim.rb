# frozen_string_literal: true

# This migration comes from decidim (originally 20181218171503)
# This file has been modified by `decidim upgrade:migrations` task on 2026-01-08 10:04:13 UTC
class AddUserGroupsSwitchToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_organizations, :user_groups_enabled, :boolean, null: false, default: false
    execute "UPDATE decidim_organizations set user_groups_enabled = true"
  end
end
