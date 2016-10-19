class RatingsController < ApplicationController


  def rate
    @user = current_user
    @aspirations = []
    groups = @user.groups.pluck(:id)
    groups.each do |group_id|
      @aspirations += Aspiration.where(group: group_id)
    end
  end
end
