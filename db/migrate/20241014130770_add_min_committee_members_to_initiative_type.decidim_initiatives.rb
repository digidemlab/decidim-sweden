# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20181213184712)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-17 21:26:03 UTC
class AddMinCommitteeMembersToInitiativeType < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives_types, :minimum_committee_members, :integer, null: true, default: nil
  end
end
