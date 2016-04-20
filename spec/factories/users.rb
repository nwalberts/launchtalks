FactoryGirl.define do
  factory :user do
    first_name "Charlie"
    last_name "Tankson"
    sequence(:email) { |n| "charlietankson#{n}@gmail.com" }
    password "password"
  end
end
