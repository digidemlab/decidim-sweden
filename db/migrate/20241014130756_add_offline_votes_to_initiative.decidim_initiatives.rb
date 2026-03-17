# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20171031183855)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-09 01:14:17 UTC
class AddOfflineVotesToInitiative < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_initiatives,
               :offline_votes, :integer
  end
end
