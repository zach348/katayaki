class GoalsController < ApplicationController
  def show
    @goal = Goal.find(params[:id])
  end
end
