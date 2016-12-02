class UsersController < ApplicationController
  before_action :restrict_user, only: [:show, :edit, :update]
  before_action :authorize_user, except: [:show, :edit, :update, :update_location]

  def show
    @user = current_user
    @groups = @user.groups
    @aspirations = @user.aspirations
  end

  def edit
    @user = current_user
  end

  def update
    current_user
    if current_user.update_attributes(user_params)
      flash[:notice] = 'User successfully updated'
      redirect_to user_path(current_user)
    else
      flash[:notice] = @user.errors.full_messages.join(', ')
      redirect_to edit_user_path(@user)
    end
  end

  def update_location
    if current_user
      user = current_user
      new_params =  {latitude: location_params['lat'], longitude: location_params['lon'] }
      user.update_attributes(new_params)
      user.save
    end
  end

  def location
    if current_user
      data = { latitude: current_user.latitude, longitude: current_user.longitude }
      respond_to do |format|
        format.json { render json: data }
        format.html { render json: { coords: data} }
      end
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

  def location_params
    params.require(:location).permit(:lon, :lat)
  end

end
