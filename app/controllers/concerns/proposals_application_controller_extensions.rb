# frozen_string_literal: true

module ProposalsApplicationControllerExtensions
  extend ActiveSupport::Concern

  included do
    helper_method :can_show_collaborative_drafts?
  end

  def can_show_collaborative_drafts?(user)
    return true if current_component.participatory_space.can_participate?(user)
    return true if current_component.participatory_space.admins.include?(user)
    return true if current_component.participatory_space.user_roles.map(&:user).include?(user)
    return false
  end

end

