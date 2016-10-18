class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    binding.pry
  end
end
