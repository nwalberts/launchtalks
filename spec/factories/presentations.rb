FactoryGirl.define do
  factory :presentation do
    sequence(:title) { |n| "How to Fly#{n}" }
    description "Best city in the world."
    
    user
  end
end
