require 'rails_helper'

feature 'new user sign up' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'new user signs up' do
    expect(User.all.last.email).to_not eq('testuser@test.com')

    visit root_path
    click_link 'Sign Up'

    fill_in 'user[email]', with: 'testuser@test.com'
    fill_in 'user[first_name]', with: 'john'
    fill_in 'user[last_name]', with: 'doe'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully')
    expect(User.all.last.email).to eq('testuser@test.com')
  end
end
