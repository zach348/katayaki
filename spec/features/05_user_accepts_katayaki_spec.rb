require 'rails_helper'

feature 'katayakies' do
  let!(:group) { FactoryGirl.create(:group, name: 'test_circle')}
  let!(:user) { FactoryGirl.create(:user) }
  let!(:goal) { FactoryGirl.create(:goal, title: 'test_goal') }
  let!(:katayaki_goal) { FactoryGirl.create(:goal, title: 'kat_goal') }
  let!(:katayaki) { FactoryGirl.create(:aspiration, goal: katayaki_goal, user: user, group: group) }

  scenario 'user accepts trending katayaki' do
    num_aspirations = Aspiration.all.length

    sign_in(user)
    click_link 'Circles'
    select 'test_circle', from: 'group[group_id]'
    click_button 'Join Circle'
    click_link 'Grow'
    click_link 'test_goal'
    click_button 'Accept'

    expect(Aspiration.all.length).to eq(num_aspirations + 1)
    aspiration = Aspiration.where(goal_id: goal.id, user_id: user.id).first
    expect(aspiration.goal.title).to eq('test_goal')

    expect(page).to have_content('Katayaki Accepted')
    expect(page).to have_content('test_goal')
  end


  scenario 'user removes katayaki' do
    num_aspirations = Aspiration.all.length

    sign_in(user)
    visit aspiration_path(katayaki)
    click_button 'Remove'

    expect(page).to have_content('Katayaki Removed')
    expect(Aspiration.all.length).to eq(num_aspirations - 1)
  end
end
