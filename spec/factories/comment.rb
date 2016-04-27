FactoryGirl.define do
  factory :comment do
    body "This is a wicked good review for the city of Boston!"

    user
    presentation
  end
end
