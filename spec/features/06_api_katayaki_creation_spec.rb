require 'rails_helper'

feature 'katayakies' do
  let!(:group) { FactoryGirl.create(:group, name: 'test_circle')}
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user searches for nonexistent goal and accepts katayaki' do
    num_aspirations = user.aspirations.count
    num_goals = Goal.count

    log_in(user)
    click_link 'Circles'
    select 'test_circle', from: 'group[group_id]'
    click_button 'Join Circle'
    click_link 'Grow'
    fill_in 'search', with: 'zeal'
    click_button 'Search'

    expect(page).to have_content('Zeal')
    expect(Goal.count).to eq(num_goals)
    expect(Goal.where(title: 'Zeal').empty?).to eq(true)

    click_link 'Zeal'
    click_button 'Accept'

    expect(page).to have_content('Seed Accepted')
    expect(Goal.count).to eq(num_goals + 1)
    expect(user.aspirations.count).to eq(num_aspirations + 1)
    expect(Goal.where(title: 'Zeal').first.details).to eq(':eagerness and  interest in pursuit of something : ')
  end
end
