# frozen_string_literal: true

# This migration comes from decidim_budgets (originally 20200728075039)
# This file has been modified by `decidim upgrade:migrations` task on 2026-01-08 10:04:13 UTC
class AddSelectedAtToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_budgets_projects, :selected_at, :date, index: true
  end
end
