# frozen_string_literal: true

require "rake"

Rails.application.load_tasks

class DigestWeeklyRemindersJob < ApplicationJob
  def perform
    Rake::Task["decidim:mailers:notifications_digest_weekly"].execute
  end
end
