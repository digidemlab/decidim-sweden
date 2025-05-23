# frozen_string_literal: true

require "rake"

Rails.application.load_tasks

class PreloadOpenDataJob < ApplicationJob
  def perform
    Rake::Task["decidim:open_data:export"].execute
  end
end
