require 'rails_helper'

feature 'user views other user page', %{
  As a signed up user
  I want to view a users page
  So that I can become friends with him and chat
} do
  # Acceptance Criteria
  # user must be able to see other users profile
  # user can see index of users

  scenario 'views user succcessfully' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user2)
    sign_in(user1)

    visit '/'

    click_on "VIEW RECIPES"

    click_on recipe.name

    click_on recipe.user.username

    expect(page).to have_content(user2.username)
    expect(page).to have_content(user2.city)
  end

  scenario 'views user index succcessfully' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    sign_in(user1)

    visit '/'

    click_on "VIEW USERS"

    expect(page).to have_content(user2.username)
  end
end
