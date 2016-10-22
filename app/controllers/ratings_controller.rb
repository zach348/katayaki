class RatingsController < ApplicationController
  def rate

  end

  def endorse
    Vote.create(user: current_user, aspiration_id: params[:id].to_i)
  end
end
