class GoalsController < ApplicationController
  def show
    @goal = Goal.find(params[:id])
    binding.pry
  end
end
