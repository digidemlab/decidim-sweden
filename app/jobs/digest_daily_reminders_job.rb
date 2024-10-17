# frozen_string_literal: true

require "rake"

Rails.application.load_tasks

class DigestDailyRemindersJob < ApplicationJob
  def perform
    Rake::Task["decidim:mailers:notifications_digest_daily"].execute
  end
end
