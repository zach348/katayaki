require 'rails_helper'

feature 'groups' do
  let!(:group) { FactoryGirl.create(:group, name: 'test_circle')}
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
   user.confirm
  end

  scenario 'user joins existing circle' do
    log_in(user)
    click_link 'Circles'
    select 'test_circle', from: 'group[group_id]'
    click_button 'Join Circle'

    expect(page).to have_content('You have joined test_circle')
    expect(user.groups.first.name).to eq('test_circle')
  end

  scenario 'user creates a new circle' do
    num_groups = Group.all.length

    log_in(user)
    click_link 'Circles'
    fill_in 'group[name]', with: 'another_circle'
    click_button 'Form Circle'

    expect(page).to have_content('Circle created successfully')
    expect(Group.all.length).to eq(num_groups + 1)
    expect(Group.all.last.name).to eq('another_circle')
  end
end
