# frozen_string_literal: true

require "rake"

class ChangeActiveStepJob < ApplicationJob
  queue_as :scheduled

  def perform
    Rails.application.load_tasks
    task.reenable
    task.invoke
  end

  def task
    Rake::Task["decidim_participatory_processes:change_active_step"]
  end
end
