# frozen_string_literal: true

# This migration comes from decidim_surveys (originally 20180321141024)
# This file has been modified by `decidim upgrade:migrations` task on 2026-03-30 18:55:57 UTC
class AddDescriptionToDecidimSurveyQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_surveys_survey_questions, :description, :jsonb
  end
end
