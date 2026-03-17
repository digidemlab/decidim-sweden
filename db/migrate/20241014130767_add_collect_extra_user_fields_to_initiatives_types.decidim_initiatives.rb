# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20181212154456)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-09 01:14:17 UTC
class AddCollectExtraUserFieldsToInitiativesTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives_types, :collect_user_extra_fields, :boolean, default: false
  end
end
