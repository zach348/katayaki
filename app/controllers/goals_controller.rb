class GoalsController < ApplicationController

  def index
    @goals = display_goals.paginate(page: params[:page], per_page: 15)
  end

  def show
    if current_user
      @goal = Goal.find(params[:id])
    else
      flash[:notice] = 'Sign Up or Sign In to Continue'
      redirect_to root_path
    end
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
      Goal.all
    end
  end

end
