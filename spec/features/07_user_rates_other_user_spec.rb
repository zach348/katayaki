require 'rails_helper'

feature 'ratings' do
  let!(:group) { FactoryGirl.create(:group, name: 'test_circle')}
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user, email: 'user2@test.com')}
  let!(:affiliation1) { FactoryGirl.create(:affiliation, group: group, user: user)}
  let!(:affiliation2) { FactoryGirl.create(:affiliation, group: group, user: user2)}
  let!(:goal) { FactoryGirl.create(:goal, title: 'test_goal') }
  let!(:katayaki_goal) { FactoryGirl.create(:goal, title: 'kat_goal') }
  let!(:katayaki) { FactoryGirl.create(:aspiration, goal: katayaki_goal, user: user, group: group) }

  scenario 'user rates', js: true do
    sign_in(user2)
    click_link('Others')
    click_link('endorse-button')
  end

end
