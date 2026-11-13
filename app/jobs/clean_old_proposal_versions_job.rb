# frozen_string_literal: true

require "rake"

Rails.application.load_tasks

class CleanOldProposalVersionsJob < ApplicationJob
  def perform
    Rake::Task["decidim_proposals:clean_old_proposal_versions"].execute
  end
end
