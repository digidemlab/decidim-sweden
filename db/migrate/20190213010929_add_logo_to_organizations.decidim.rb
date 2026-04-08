# frozen_string_literal: true

# This migration comes from decidim (originally 20161214152811)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-30 18:55:52 UTC
class AddLogoToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_organizations, :logo, :string
  end
end
