FactoryGirl.define do
 factory :user do
   first_name 'John'
   last_name 'Doe'
   sequence(:username) { |n| 'user' + n.to_s }
   sequence(:email) { |n| 'John' + n.to_s + '@test.com' }
   password 'devise'
 end
end
