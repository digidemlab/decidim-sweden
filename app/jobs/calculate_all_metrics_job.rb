# frozen_string_literal: true

require "rake"

Rails.application.load_tasks

class CalculateAllMetricsJob < ApplicationJob
  def perform
    Rake::Task["decidim:metrics:all"].execute
  end
end
