FactoryGirl.define do
 factory :aspiration do
   association :goal, factory: :goal
   association :user, factory: :user
   association :group, factory: :group
 end
end
