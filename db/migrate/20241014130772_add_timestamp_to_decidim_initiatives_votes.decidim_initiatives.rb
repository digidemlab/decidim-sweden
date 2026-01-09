# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20181224100803)
# This file has been modified by `decidim upgrade:migrations` task on 2026-01-08 10:04:14 UTC
class AddTimestampToDecidimInitiativesVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives_votes, :timestamp, :string
  end
end
