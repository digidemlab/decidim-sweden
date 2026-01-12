# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20181224101041)
# This file has been modified by `decidim upgrade:migrations` task on 2026-01-08 10:04:14 UTC
class AddHashIdToDecidimInitiativesVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives_votes, :hash_id, :string
  end
end
