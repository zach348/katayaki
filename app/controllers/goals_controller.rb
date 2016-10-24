class GoalsController < ApplicationController
  def show
    @goal = Goal.find(params[:id])
  end

  def search
    @search_term = params[:search]
    @goals = display_goals
    binding.pry
  end

  protected

  def display_goals
    if params[:search]
      Goal.search(params[:search])
    else
      Goal.all.to_a
    end
  end
end
