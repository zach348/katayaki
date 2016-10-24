class RatingsController < ApplicationController
  def rate

  end

  def endorse
    binding.pry
    aspiration_id = params[:id].to_i
    if Vote.where(user_id: current_user.id, aspiration_id: aspiration_id)
      Vote.create(user: current_user, aspiration_id: aspiration_id )
    end
  end

  protected

  def vote_params
    params.require(:vote).permit(:id)
  end
end
