# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_girl_rails'

50.times do
  FactoryGirl.create(:user)
end

3.times do
  FactoryGirl.create(:group)
end

100.times do
  FactoryGirl.create(:goal)
end

User.all.each do |user|
  3.times do
    goal_index = rand(Goal.count)
    goal = Goal.offset(goal_index).first
    group_index = rand(Group.count)
    group = Group.offset(group_index).first
    FactoryGirl.create(:aspiration, user: user, goal: goal, group: group)
  end
  random_index = rand(Group.count)
  group = Group.offset(random_index).first
  FactoryGirl.create(:affiliation, user: user, group: group)
end

300.times do
  user_index = rand(User.count)
  user = User.offset(user_index).first
  aspiration_index = rand(Aspiration.count)
  aspiration = Aspiration.offset(aspiration_index).first
  FactoryGirl.create(:vote, user: user, aspiration: aspiration )
end
