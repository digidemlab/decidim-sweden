# frozen_string_literal: true

require "rake"

Rails.application.load_tasks

class ExpireDownloadDataFilesJob < ApplicationJob
  def perform
    Rake::Task["decidim:delete_download_your_data_files"].execute
  end
end
