# frozen_string_literal: true

require "rake"

Rails.application.load_tasks

class DeleteRegistrationFormsJob < ApplicationJob
  def perform
    Rake::Task["decidim_meetings:clean_registration_forms"].execute
  end
end
