# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20190125131847)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-17 21:26:03 UTC
class AddDocumentNumberAuthorizationHandlerToInitiativesTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives_types, :document_number_authorization_handler, :string
  end
end
