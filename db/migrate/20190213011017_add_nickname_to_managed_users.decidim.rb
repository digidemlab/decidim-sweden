# frozen_string_literal: true

# This migration comes from decidim (originally 20180706104107)
# This file has been modified by `decidim upgrade:migrations` task on 2026-01-08 10:04:13 UTC
class AddNicknameToManagedUsers < ActiveRecord::Migration[5.2]
  class User < ApplicationRecord
    self.table_name = :decidim_users
  end

  def up
    User.where(managed: true, nickname: nil).includes(:organization).find_each do |user|
      user.nickname = UserBaseEntity.nicknamize(user.name, organization: user.organization)
      user.save
    end
  end
end
