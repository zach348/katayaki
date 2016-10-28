class UsersController < ApplicationController
  before_action :restrict_user, only: [:show, :edit, :update]
  before_action :authorize_user, except: [:show, :edit, :update]

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

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def restrict_user
    if !user_signed_in? || current_user.id != params[:id].to_i
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
