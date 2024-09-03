# frozen_string_literal: true

require "rake"

class ExpireDownloadDataFilesJob < ApplicationJob
  queue_as :scheduled

  def perform
    Rails.application.load_tasks
    task.reenable
    task.invoke
  end

  def task
    Rake::Task["decidim:delete_download_your_data_files"]
  end
end
