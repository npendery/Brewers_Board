require 'rails_helper'

feature 'user reviews a recipe', %{
  As a signed up user
  I want to review a recipe
  So that I can show users what I think of it
} do
  # Acceptance Criteria
  # if the review is filled out correctly, the review will posted
  # if the review is filled out incorrectly, an error will be shown
  # a user can only review a recipe once

  scenario 'reviews recipe succcessfully' do
    user = FactoryGirl.create(:user)
    recipe1 = FactoryGirl.create(:recipe)
    sign_in(user)

    visit '/'

    click_on "VIEW RECIPES"

    click_on recipe1.name

    click_on "Review Recipe"

    fill_in "review[title]", with: "Love the malt character"
    fill_in "Description", with: "Would add more 30 minute hops for bitterness"

    choose "review_rating_4"

    click_on "Create review"

    expect(page).to have_content("Review added!")
    expect(page).to have_content(recipe1.name)
  end

  scenario 'reviews recipe unsucccessfully' do
    user = FactoryGirl.create(:user)
    recipe1 = FactoryGirl.create(:recipe)
    sign_in(user)

    visit '/'

    click_on "VIEW RECIPES"

    click_on recipe1.name

    click_on "Review Recipe"

    click_on "Create review"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Rating can't be blank")
  end

  scenario 'cant review recipe twice' do
    user = FactoryGirl.create(:user)
    recipe1 = FactoryGirl.create(:recipe)
    sign_in(user)

    visit '/'

    click_on "VIEW RECIPES"

    click_on recipe1.name

    click_on "Review Recipe"

    fill_in "Title", with: "Love the malt character"
    fill_in "Description", with: "Would add more 30 minute hops for bitterness"
    choose "review_rating_4"

    click_on "Create review"

    expect(page).to have_content("Review added!")
    expect(page).to have_content(recipe1.name)
    expect(page).to_not have_content("Review recipe")
  end
end
