require 'rails_helper'
require 'spec_helper'

describe RatingsController, type: :controller do
  context 'endorse' do
    it 'returns a json object with key coords and subkeys latitude and longitude' do
      user = FactoryGirl.create(:user)
      user.confirm
      marked_user = FactoryGirl.create(:user)
      marked_user.confirm
      group = FactoryGirl.create(:group)
      goal = FactoryGirl.create(:goal)
      affiliation = FactoryGirl.create(:affiliation, user: marked_user, group: group)
      aspiration = FactoryGirl.create(:aspiration, group: group, goal: goal, user: marked_user)
      num_votes = Vote.count

      sign_in user
      params = { rating: { aspiration_id: aspiration.id }}
      xhr :post, :endorse, params

      expect(Vote.count).to eq(num_votes + 1)
    end
  end
end
