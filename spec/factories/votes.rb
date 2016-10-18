FactoryGirl.define do
 factory :vote do
   association :user, factory: :user
   association :aspiration, factory: :aspiration
   value { [-1,1].sample }
 end
end
