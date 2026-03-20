# frozen_string_literal: true

# This migration comes from decidim (originally 20170405094028)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-17 21:26:01 UTC
class AddOrganizationToIdentities < ActiveRecord::Migration[5.0]
  def change
    add_reference :decidim_identities, :decidim_organization, index: true, foreign_key: true
  end
end
