# frozen_string_literal: true

# This migration comes from decidim (originally 20200320105927)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-17 21:26:02 UTC
class IndexForeignKeysInOAuthAccessGrants < ActiveRecord::Migration[5.2]
  def change
    add_index :oauth_access_grants, :resource_owner_id
  end
end
