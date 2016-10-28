FactoryGirl.define do
  factory :goal do
    sequence(:title) { |n| 'goal title' + n.to_s }
    sequence(:details) { |n| 'description' + n.to_s }
  end
end
