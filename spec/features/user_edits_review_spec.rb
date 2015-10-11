require 'rails_helper'

feature 'user edits a review', %{
  As a signed up user
  I want to edit a review
  So that users can see my changes
} do
  # Acceptance Criteria
  # if the review is filled out correctly, the edited review will posted
  # if the review is filled out incorrectly, an error will be shown

  scenario 'reviews recipe succcessfully' do
    user = FactoryGirl.create(:user)
    recipe1 = FactoryGirl.create(:recipe)
    review = FactoryGirl.create(:review, user: user, recipe: recipe1)
    sign_in(user)

    visit '/'

    click_on "VIEW RECIPES"

    click_on recipe1.name

    click_on "Edit Review"

    fill_in "Description", with: "Would add more 30 minute hops for bitterness"

    click_on "Update review"

    expect(page).to have_content("Review Updated")
    expect(page).to have_content(review.description)
    expect(page).to have_content(recipe1.name)
  end

  scenario 'reviews recipe unsucccessfully' do
    user = FactoryGirl.create(:user)
    recipe1 = FactoryGirl.create(:recipe)
    review = FactoryGirl.create(:review, user: user, recipe: recipe1)
    sign_in(user)

    visit '/'

    click_on "VIEW RECIPES"

    click_on recipe1.name

    expect(page).to have_content(review.title.capitalize)

    click_on "Edit Review"

    fill_in "Title", with: ''

    click_on "Update review"

    expect(page).to have_content("Title can't be blank")
  end
end
