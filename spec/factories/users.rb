FactoryGirl.define do
  factory :user do
    first_name "Charlie"
    last_name "Tankson"
    sequence(:email) { |n| "charlietankson#{n}@gmail.com" }
    password "password"
    bio "Hello! My name is Charlie and I am a web developer at launch academy!"
  end
end
