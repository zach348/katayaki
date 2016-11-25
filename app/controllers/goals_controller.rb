class GoalsController < ApplicationController

  def index
    @goals = display_goals.paginate(page: params[:page], per_page: 10)
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new(goal_params)
    render template: 'goals/show'
  end

  def search
    @search_term = params[:search]
    # @new_goals = Goal.get_defs(@search_term)
    @goals = display_goals.paginate(page: params[:page], per_page: 10)
  end

  protected

  def display_goals
    if params[:search]
      Goal.search(params[:search])
    else
      Goal.all.order(title: :asc)
    end
  end

  def goal_params
    params.require(:goal).permit(:title, :details)
  end

end
