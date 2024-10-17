# frozen_string_literal: true

require "rake"

Rails.application.load_tasks

class GenerateRemindersJob < ApplicationJob
  def perform
    Rake::Task["decidim:reminders:all"].execute
  end
end
