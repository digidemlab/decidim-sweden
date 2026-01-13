# frozen_string_literal: true

# This migration comes from decidim (originally 20181108131058)
# This file has been modified by `decidim upgrade:migrations` task on 2026-01-08 10:04:13 UTC
class AddUsersRegistrationModeToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_organizations, :users_registration_mode, :integer, default: 0, null: false
  end
end
