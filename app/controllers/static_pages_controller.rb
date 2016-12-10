class StaticPagesController < ApplicationController
  def index
    redirect_to user_path(current_user) if current_user && !params[:get_splash]
  end
end
