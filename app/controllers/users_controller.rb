class UsersController < ApplicationController
  def show
    @user = current_user
    @groups = @user.groups
    @goals = @user.goals
  end
end
