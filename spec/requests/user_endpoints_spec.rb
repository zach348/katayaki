require 'rails_helper'
require 'spec_helper'

describe UsersController, type: :controller do
  context 'location' do
    it 'returns a json object with key coords and subkeys latitude and longitude' do
      user = FactoryGirl.create(:user)
      sign_in user

      get :location
      hash = Hash(JSON.parse(response.body))

      expect(response).to be_success
      expect(hash.has_key?("coords")).to eq(true)
      expect(hash["coords"].has_key?("latitude")).to eq(true)
      expect(hash["coords"].has_key?("longitude")).to eq(true)
    end
  end

  context 'update_location' do
    it 'accepts json location params and updates user location in the database' do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      user.latitude = 0
      user.longitude = 0
      sign_in user
      params = { location: { lat: user.latitude, lon: user.longitude }}
      post :update_location, params
      expect(user.latitude).to eq(0)
      expect(user.longitude).to eq(0)
    end
  end
end
