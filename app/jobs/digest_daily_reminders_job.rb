# frozen_string_literal: true

require "rake"

class DigestDailyRemindersJob < ApplicationJob
  queue_as :scheduled

  def perform
    Rails.application.load_tasks
    task.reenable
    task.invoke
  end

  def task
    Rake::Task["decidim:mailers:notifications_digest_daily"]
  end
end
