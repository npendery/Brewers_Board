require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "newuser#{n}" }
    city "Boston, MA"
    sequence(:email) { |n| "newuser#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :recipe do
    sequence(:name) { |n| "recipe #{n}" }
    description "Hoppy and dense"
    malt_grains "List \n of \n ingredients"
    hops_schedule "First \n Second \n Third"
    directions "You do this"
    yeast "Yeast selection"
    user
  end

  factory :review do
    sequence(:title) { |n| "title#{n}" }
    rating 4
    recipe
    user
  end

  factory :group do
    sequence(:name) { |n| "name#{n}" }
    description "Beer Makin"
    location "Everywhere"
    admin FactoryGirl.create(:user)
  end
end
