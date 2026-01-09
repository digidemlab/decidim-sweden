# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20170220152416)
# This file has been modified by `decidim upgrade:migrations` task on 2026-01-08 10:04:14 UTC
class AddHiddenAtToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_proposals_proposals, :hidden_at, :datetime
  end
end
