# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20171102094250)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-09 01:14:17 UTC
class DropInitiativeDescriptionIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index :decidim_initiatives, :description
  end
end
