if Decidim::DecidimAwesome.enabled?(:weighted_proposal_voting)
  # register available processors
  Decidim::DecidimAwesome.voting_registry.register(:graded_vote) do |voting|
    voting.show_vote_button_view = "decidim/decidim_awesome/voting/graded_vote/show_vote_button"
    #voting.show_votes_count_view = "decidim/decidim_awesome/voting/graded_vote/show_votes_count"
    # voting.show_votes_count_view = "" # hide votes count if needed
    voting.proposal_metadata_cell = "decidim/decidim_awesome/voting/proposal_metadata"
    # define a weight validator (optional, by default all weights are valid)
    voting.weight_validator do |weight, context|
      weight.in? [-2, -1, 0, 1, 2]
    end

    # optionally, define a label generator block
    # by default labels are extracted from a I18n key following this rule
    # "decidim.decidim_awesome.voting.{MANIFEST_NAME}.weights.weight_{WEIGHT}"
    #
    # voting.label_generator do |weight, context|
    #   "Weight #{weight.round}"
    # end
  end
end
