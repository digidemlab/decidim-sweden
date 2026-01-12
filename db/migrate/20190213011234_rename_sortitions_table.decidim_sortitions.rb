# frozen_string_literal: true

# This migration comes from decidim_sortitions (originally 20180108132729)
# This file has been modified by `decidim upgrade:migrations` task on 2026-01-08 10:04:14 UTC
class RenameSortitionsTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :decidim_module_sortitions_sortitions, :decidim_sortitions_sortitions
  end
end
