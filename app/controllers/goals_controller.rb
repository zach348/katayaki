class GoalsController < ApplicationController

  def index
    @goals = Goal.paginate(page: params[:page], per_page: 5)
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def search
    @search_term = params[:search]
    @goals = display_goals
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
