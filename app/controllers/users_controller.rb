class UsersController < ApplicationController
  def show
    @user = current_user
    @groups = @user.groups
    @aspirations = @user.aspirations
  end
end
