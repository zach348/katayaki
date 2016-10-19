class AspirationsController < ApplicationController
  def show
    @aspiration = Aspiration.find(params[:id])
  end

  def index
    respond_to do |format|
      format.json do
        data = []
        aspirations = Aspiration.rate_items_for(current_user)
        aspirations.each do |aspiration|
          title = Goal.find(aspiration.goal).title
          description = Goal.find(aspiration).description
          data.push(
            { User.find(aspiration.user.full_name) :  }
          )
        end

      end
    end
  end
end
