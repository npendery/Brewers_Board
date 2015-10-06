require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    city "Boston, MA"
    sequence(:email) { |n| "user#{n}@example.com" }
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
end
