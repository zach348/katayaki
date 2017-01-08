require 'rails_helper'
require 'spec_helper'

describe AspirationsController, type: :controller do
  context 'markers' do
    it 'returns a json populated with markers when there are users in bounds' do
      user = FactoryGirl.create(:user)
      marked_user = FactoryGirl.create(:user)
      group = FactoryGirl.create(:group)
      goal = FactoryGirl.create(:goal)
      FactoryGirl.create(:affiliation, user: marked_user, group: group)
      FactoryGirl.create(:aspiration, group: group, goal: goal, user: marked_user)

      marked_user.latitude = 0
      marked_user.longitude = 0
      marked_user.save
      marked_user.reload

      params = { bounds: {
                            SW: [-17.644022, -18.984375],
                            NE: [11.005904, 8.173828]
                         }
               }

      sign_in user

      get :markers, params
      hash = Hash(JSON.parse(response.body))
      marker = hash['markers'].first

      expect(hash['markers'].length).to eq(1)
      expect(marker["lat"]).to eq(0)
      expect(marker["lng"]).to eq(0)
      expect(marker['title']).to eq('goal title1')
      expect(marker['details']).to eq('detailsdetails')
    end
  end

  context 'rating items' do
    it 'returns rating items for users in a shared group' do
      user = FactoryGirl.create(:user)
      rated_user = FactoryGirl.create(:user)
      group = FactoryGirl.create(:group)
      goal = FactoryGirl.create(:goal)
      FactoryGirl.create(:affiliation, user: rated_user, group: group)
      FactoryGirl.create(:affiliation, user: user, group: group)
      FactoryGirl.create(:aspiration, group: group, goal: goal, user: rated_user)

      sign_in user
      get :index
      aspirations = JSON.parse(response.body)
      aspiration = aspirations.first

      expect(aspirations.length).to eq(1)
      expect(aspiration['user']).to eq('John Doe')
      expect(aspiration['img_url']).to eq('default_avatar.png')
      expect(aspiration['goal']).to eq('goal title2')
      expect(aspiration['details']).to eq('detailsdetails')
    end
  end

end
