FactoryGirl.define do
 factory :vote do
   association :user, factory: :user
   association :aspiration, factory: :aspiration
 end
end
