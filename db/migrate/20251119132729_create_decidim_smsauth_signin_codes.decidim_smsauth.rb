# frozen_string_literal: true

# This migration comes from decidim_smsauth (originally 20230830070318)
class CreateDecidimSmsauthSigninCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :decidim_smsauth_signin_codes do |t|
      t.string :code_hash
      t.references :decidim_signin_code_set, null: false, index: { name: "index_signin_codes_on_decidim_signin_code_set_id" }
      t.datetime :created_at
    end
  end
end
