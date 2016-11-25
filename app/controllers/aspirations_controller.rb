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
          to_be_rated.each do |aspiration|
            hashed = aspiration.to_hash
            data.push(hashed)
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
    if aspiration_params[:id].empty?
      goal = Goal.create(title: aspiration_params[:title], details: aspiration_params[:details])
    else
      goal = Goal.find(aspiration_params[:id])
    end
    group = Group.find(group_params[:group_id])
    new_aspiration = Aspiration.new(user: user, goal: goal, group: group)

    if Aspiration.aspiration_exists?(goal, user, group)
      flash[:notice] = 'You have already accepted this Katayaki'
      redirect_to goals_path
    elsif new_aspiration.save
      flash[:notice] = 'Katayaki Accepted'
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
    flash[:notice] = 'Katayaki Removed'
    redirect_to user_path(current_user)
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

end
