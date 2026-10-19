Rails.application.config.to_prepare do
  Decidim::Proposals::ProposalMetadataCell.prepend(
    Decidim::DecidimAwesome::Voting::GradedVote::ProposalMetadata
  )
end

if Decidim::DecidimAwesome.enabled?(:weighted_proposal_voting)
  Decidim::DecidimAwesome.voting_registry.register(:graded_vote) do |voting|
    voting.show_vote_button_view = "decidim/decidim_awesome/voting/graded_vote/show_vote_button"
    voting.show_votes_count_view = "decidim/decidim_awesome/voting/graded_vote/show_votes_count"

    voting.weight_validator do |weight, context|
      weight.in? [-2, -1, 0, 1, 2]
    end
  end
end
