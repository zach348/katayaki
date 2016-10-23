class RatingsController < ApplicationController
  def rate

  end

  def endorse
    aspiration_id = params[:id].to_i
    if Vote.where(user_id: current_user.id, aspiration_id: aspiration_id)
      Vote.create(user: current_user, aspiration_id: aspiration_id )
    end
  end
end
