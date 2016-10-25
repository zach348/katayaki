class RatingsController < ApplicationController
  def rate

  end

  def endorse
    if Vote.where(user_id: current_user.id, aspiration_id: rating_params[:aspiration_id])
      Vote.create(user: current_user, aspiration_id: rating_params[:aspiration_id] )
    end
  end

  protected

  def rating_params
    params.require(:rating).permit(:aspiration_id)
  end
end
