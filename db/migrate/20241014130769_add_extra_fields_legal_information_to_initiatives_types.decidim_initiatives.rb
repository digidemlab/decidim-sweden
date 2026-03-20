# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20181212155740)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-17 21:26:03 UTC
class AddExtraFieldsLegalInformationToInitiativesTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives_types, :extra_fields_legal_information, :jsonb
  end
end
