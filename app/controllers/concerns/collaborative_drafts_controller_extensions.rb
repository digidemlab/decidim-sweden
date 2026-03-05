# frozen_string_literal: true

module CollaborativeDraftsControllerExtensions
  extend ActiveSupport::Concern

  included do
    before_action :require_membership
  end

  private

  def require_membership
    raise ActionController::RoutingError, "Not Found" unless can_show_collaborative_drafts?(current_user)
  end

end
