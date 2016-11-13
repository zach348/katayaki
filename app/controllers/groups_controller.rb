class GroupsController < ApplicationController
  before_action :restrict_user, only: [:show, :index, :create]
  before_action :authorize_user, except: [:show, :index, :create]

  def show
    @group = Group.find(params[:id])
  end

  def index
    @groups = Group.all
    @new_group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save
      flash[:notice] = 'Circle created successfully'
      redirect_to groups_path
    else
      flash[:notice] = group.errors.full_messages.join(', ')
      redirect_to groups_path
    end
  end

  protected

  def group_params
    params.require(:group).permit(:name)
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
