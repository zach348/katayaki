FactoryGirl.define do
 factory :affiliation do
   association :group, factory: :group
   association :user, factory: :user
 end
end
