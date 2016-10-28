class GroupsController < ApplicationController
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

end
