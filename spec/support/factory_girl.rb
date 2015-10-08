require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "newuser#{n}" }
    city "Boston, MA"
    sequence(:email) { |n| "newuser#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    admin false
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
    owner FactoryGirl.create(:user)
  end

  factory :event do
    sequence(:title) { |n| "title#{n}" }
    description "New Event"
    street "1234 Tremont St"
    city "Cambridge"
    state "MA"
    date "10/12/15"
    time "2:00pm"
    user FactoryGirl.create(:user)
    group FactoryGirl.create(:group)
  end
end
