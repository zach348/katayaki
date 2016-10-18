FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| 'group' + n.to_s }
  end
end
