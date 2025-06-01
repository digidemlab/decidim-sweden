# frozen_string_literal: true

require "rake"

Rails.application.load_tasks

class DeleteWithdrawnProposalsJob < ApplicationJob
  def perform
    Rake::Task["withdrawn_proposals_cleaner:clean"].execute
  end
end
