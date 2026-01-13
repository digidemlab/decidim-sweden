# frozen_string_literal: true

# This migration comes from decidim_comments (originally 20210529095942)
# This file has been modified by `decidim upgrade:migrations` task on 2026-01-08 10:04:13 UTC
class AddDeletedAtColumnToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :decidim_comments_comments, :deleted_at, :datetime
  end
end
