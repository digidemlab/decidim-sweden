# frozen_string_literal: true

require "rake"

Rails.application.load_tasks

class ChangeActiveStepJob < ApplicationJob
  def perform
    Rake::Task["decidim_participatory_processes:change_active_step"].execute
  end
end
