class UsersController < ApplicationController
  def show
    @user = current_user
    @groups = @user.groups
    @aspirations = @user.aspirations
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:notice] = 'User successfully updated'
      redirect_to user_path(@user)
    else
      flash[:notice] = @user.errors.full_messages.join(', ')
      redirect_to edit_user_path(@user)
    end
  end

  protected

  def user_params
  params.require(:user).permit(
    :id,
    :email,
    :first_name,
    :last_name,
    :username,
    :avatar,
    :avatar_cache
  )
end
end
