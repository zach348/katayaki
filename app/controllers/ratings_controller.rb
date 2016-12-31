class RatingsController < ApplicationController
  before_action :authorize_user

  def rate
  end

  def endorse
    if Vote.where(user_id: current_user.id, aspiration_id: rating_params[:aspiration_id]).empty?
      vote = Vote.create(user: current_user, aspiration_id: rating_params[:aspiration_id] )
      AspirationMailer.new_impact(vote).deliver
    end
  end

  protected

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def rating_params
    params.require(:rating).permit(:aspiration_id)
  end
end
