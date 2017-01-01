require 'rails_helper'

feature 'profile update' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user can update their profile information' do
    log_in user
    visit root_path
    click_link 'Account'

    fill_in 'user[email]', with: 'newemail@test.com'
    fill_in 'user[current_password]', with: user.password
    click_button 'Update Account'
    user.reload

    expect(user.email).to eq('newemail@test.com')
  end
end
