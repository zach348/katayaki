# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require './seedData'

50.times do |n|
  User.create(first_name: 'John', last_name: 'Doe', username: "user#{n}", email: "john#{n}@test.com", password: 'devise')
end

3.times do |n|
  Group.create(name: "group#{n}")
end

50.times do |n|
  Goal.create(title: "goal title #{n}")
end

User.all.each do |user|
  5.times do
    goal_index = rand(Goal.count)
    goal = Goal.offset(goal_index).first
    group_index = rand(Group.count)
    group = Group.offset(group_index).first
    Aspiration.create(user: user, goal: goal, group: group)
  end
  random_index = rand(Group.count)
  group = Group.offset(random_index).first
  Affiliation.create(user: user, group: group)
end

300.times do
  user_index = rand(User.count)
  user = User.offset(user_index).first
  aspiration_index = rand(Aspiration.count)
  aspiration = Aspiration.offset(aspiration_index).first
  Vote.create(user: user, aspiration: aspiration )
end
