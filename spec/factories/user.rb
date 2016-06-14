FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "TomBrady#{n}" }
    sequence(:email) { |n| "goat#{n}@gmail.com" }
    sequence(:password) { |n| "password#{n}" }
  end
end
