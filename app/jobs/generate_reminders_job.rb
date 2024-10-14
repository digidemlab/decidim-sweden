# frozen_string_literal: true

require "rake"

class GenerateRemindersJob < ApplicationJob
  queue_as :scheduled

  def perform
    Rails.application.load_tasks
    task.reenable
    task.invoke
  end

  def task
    Rake::Task["decidim:reminders:all"]
  end
end
