# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20200320105921)
# This file has been modified by `decidim upgrade:migrations` task on 2026-01-08 10:04:14 UTC
class IndexForeignKeysInDecidimInitiativesVotes < ActiveRecord::Migration[5.2]
  def change
    add_index :decidim_initiatives_votes, :decidim_user_group_id
    add_index :decidim_initiatives_votes, :hash_id
  end
end
