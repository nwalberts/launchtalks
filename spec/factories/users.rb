FactoryGirl.define do
  factory :user do
    first_name "Nick"
    last_name "Alberts"
    sequence(:email) { |n| "nalberts#{n}@gmail.com" }
    password "password"
  end
end
