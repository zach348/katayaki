class AspirationsController < ApplicationController
  def show
    @aspiration = Aspiration.find(params[:id])
  end
end