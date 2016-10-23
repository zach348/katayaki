class GoalsController < ApplicationController
  def show
    @goal = Goal.find(params[:id])
  end

  def search
    binding.pry
    @search_term = params[:search]
    @goals = display_goals
  end

  private

  def display_figures
    if params[:search]
      Goal.search(params[:search])
    else
      Goal.all.to_a
    end
  end
end
