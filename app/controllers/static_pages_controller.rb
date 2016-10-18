class StaticPagesController < ApplicationController

  def index
     if current_user then redirect_to user_path(current_user) end

  end

end
