class AspirationsController < ApplicationController
  before_action :authorize_user, only: [:show, :index, :create, :destroy]

  def show
    @aspiration = Aspiration.find(params[:id])
  end

  def index
    if current_user
      respond_to do |format|
        format.json do
          data = []
          to_be_rated = Aspiration.rating_items_for(current_user, 1)
          if to_be_rated.empty?
            data.push({goal: '' })
          else
            to_be_rated.each do |aspiration|
              hashed = aspiration.to_hash
              data.push(hashed)
            end
          end
          render json: data
        end
        format.html do
          data = []
          to_be_rated = Aspiration.rating_items_for(current_user, 1)
          if to_be_rated.empty?
            data.push({goal: '' })
          else
            to_be_rated.each do |aspiration|
              hashed = aspiration.to_hash
              data.push(hashed)
            end
          end
          render json: data
        end
      end
    else
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def create
    user = current_user
    if Goal.where(title: aspiration_params[:title], details: aspiration_params[:details]).empty?
      goal = Goal.create(title: aspiration_params[:title], details: aspiration_params[:details])
    else
      goal = Goal.where(title: aspiration_params[:title], details: aspiration_params[:details]).first
    end
    group = Group.find(group_params[:group_id])
    new_aspiration = Aspiration.new(user: user, goal: goal, group: group)

    if Aspiration.aspiration_exists?(goal, user, group)
      flash[:notice] = 'You have already accepted this seed'
      redirect_to goals_path
    elsif user.aspirations.count >= 4
      flash[:notice] = 'Focus, Grasshopper.'
      redirect_to user_path(user)
    elsif new_aspiration.save
      flash[:notice] = 'Seed Accepted'
      aspiration = Aspiration.where(user: user, goal: goal, group: group).first
      redirect_to aspiration_path(aspiration)
    else
      flash[:notice] = new_aspiration.errors.full_messages.join(', ')
      redirect_to goals_path
    end
  end

  def destroy
    @aspiration = Aspiration.find(params[:id])
    @aspiration.destroy
    flash[:notice] = 'Seed Removed'
    redirect_to user_path(current_user)
  end

  def markers
    users = User.in_bounds([bounds_params[:SW], bounds_params[:NE]]).limit(250)
    markers = Aspiration.markers_for_users(users, current_user)
    respond_to do |format|
      format.json { render json: { markers: markers } }
      format.html { render json: { markers: markers } }
    end
  end

  protected

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def aspiration_params
    params.require(:goal).permit(:id, :title, :details)
  end

  def group_params
    params.require(:group).permit(:group_id)
  end

  def bounds_params
    params.require(:bounds)
  end

end
