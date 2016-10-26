class AffiliationsController < ApplicationController
  def create
    group = Group.find(group_params[:group_id])
    if Affiliation.where(group_id: group_params[:group_id], user_id: current_user.id).empty?
      affiliation = Affiliation.new(group_id: group_params[:group_id], user: current_user)
      if affiliation.save
        flash[:notice] = "You have joined #{group.name}"
        redirect_to user_path(current_user)
      else
        flash[:notice] = "There was problem joining #{group.name}"
        redirect_to groups_path
      end
    else
      flash[:notice] = "You are already a member of #{group.name}"
      redirect_to groups_path
    end
  end

  protected

  def group_params
    params.require(:group).permit(:group_id)
  end

end
