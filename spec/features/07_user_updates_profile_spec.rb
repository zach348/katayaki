require 'rails_helper'

feature 'profile update' do
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    user.confirm
  end

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

  scenario 'devise throws error message without password' do
    log_in user
    visit root_path
    click_link 'Account'
    fill_in 'user[email]', with: 'newemail@test.com'
    fill_in 'user[current_password]', with: ""
    click_button 'Update Account'

    expect(page).to have_content("Current password can't be blank")
  end
end
