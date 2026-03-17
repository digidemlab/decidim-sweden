# frozen_string_literal: true

# This migration comes from decidim (originally 20170131134349)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-09 01:14:17 UTC
class AddActionPermissionsToDecidimFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_features, :permissions, :jsonb
  end
end
