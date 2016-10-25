class AspirationsController < ApplicationController
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
            hashed = Aspiration.to_hash(aspiration)
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
    goal = Goal.find(aspiration_params[:goal_id])
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
      raise ActionController::RoutingError.new("There seems to a problem")
    end
  end

  protected

  def aspiration_params
    params.require(:goal).permit(:goal_id)
  end

  def group_params
    params.require(:group).permit(:group_id)
  end

end
