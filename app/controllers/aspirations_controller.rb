class AspirationsController < ApplicationController
  def show
    @aspiration = Aspiration.find(params[:id])
  end

  def index
    if current_user
      respond_to do |format|
        format.json do
          data = []
          aspirations = Aspiration.rate_items_for(current_user, 10)
          aspirations.each do |aspiration|
            hashed = Aspiration.to_hash(aspiration)
            data.push(hashed)
          end
        render json: data
        end
      end
    else
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
