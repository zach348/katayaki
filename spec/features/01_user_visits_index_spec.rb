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
    expect(page).to have_content 'Katayaki'
  end

  scenario 'inauthenticated sees only trending goals on splash page' do
    visit root_path
    expect(page).to have_content('trending')
    expect(page).to have_content('Aspire')
    expect(page).to_not have_content('Rate')
  end

  scenario 'inauthenticated can visit goal page' do
    visit root_path
    click_link 'trending1'
    expect(page).to have_content('description')
    expect(page).to have_content('trending1')
  end

  scenario 'inauthenticated user can visit search page' do
    visit root_path
    click_link 'Aspire'
    expect(page).to have_selector(:link_or_button, 'Search')
  end
end
