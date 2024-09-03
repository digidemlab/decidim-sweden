# frozen_string_literal: true

require "rake"

class DeleteRegistrationFormsJob < ApplicationJob
  queue_as :scheduled

  def perform
    Rails.application.load_tasks
    task.reenable
    task.invoke
  end

  def task
    Rake::Task["decidim_meetings:clean_registration_forms"]
  end
end
