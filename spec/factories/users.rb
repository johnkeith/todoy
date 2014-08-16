# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "tester_#{n}@testing.com" }
    password "password"
  end
end
