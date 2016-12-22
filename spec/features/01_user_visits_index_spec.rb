require 'rails_helper'

feature 'index page' do
  let!(:group) { FactoryGirl.create(:group) }

  before(:each) do
    10.times do |n|
      FactoryGirl.create(:goal, title: "goal#{n}")
    end

    trending = []

    5.times do |n|
      trending.push(FactoryGirl.create(:goal, title: "trending#{n}"))
    end

    trending.each do |goal|
      5.times do |n|
        FactoryGirl.create(:aspiration, goal: goal, group: group)
      end
    end
  end

  scenario 'inauthenticated user sees header' do
    visit root_path
    expect(page).to have_content 'Self'
  end

  scenario 'inauthenticated sees only trending goals on splash page' do
    visit root_path
    expect(page).to have_content('Seeds')
    expect(page).to have_content('Grow')
    expect(page).to_not have_content('Others')
  end

  scenario 'inauthenticated user can visit search page' do
    visit root_path
    click_link 'Grow'
    expect(page).to have_selector(:link_or_button, 'Search')
  end
end
