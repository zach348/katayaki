class AspirationsController < ApplicationController
  def show
    @aspiration = Aspiration.find(params[:id])
    binding.pry
  end
end
