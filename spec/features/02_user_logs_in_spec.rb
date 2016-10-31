require 'rails_helper'

feature 'login' do
  let!(:user) { FactoryGirl.create(:user, email: 'user@test.com', password: 'password') }

  scenario 'inauthenticated user attempts to log in' do
    visit root_path
    click_link 'Sign In'

    fill_in 'user[email]', with: 'Stranger@danger.com'
    fill_in 'user[password]', with: 'Danger'
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password')
  end

  scenario 'authenticated user attempts to log in' do
    sign_in(user)

    expect(page).to have_content('Signed in successfully')
  end

  scenario 'authenticated user is directed to respective show page' do
    sign_in(user)

    expect(current_path).to eq(user_path(user))
  end
end
