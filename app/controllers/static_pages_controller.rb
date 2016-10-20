class StaticPagesController < ApplicationController

  def index
    if current_user && !params[:get_splash]
      redirect_to user_path(current_user)
    else
      @trending = Goal.top(3)
    end
  end
end
