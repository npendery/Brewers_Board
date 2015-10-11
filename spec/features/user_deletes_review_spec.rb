require 'rails_helper'

feature 'user deletes a review', %{
  As a signed up user
  I want to edit a review
  So that users cant see my review
} do
  # Acceptance Criteria
  # if the review is deleted, it will no longer show on the page

  scenario 'reviews recipe succcessfully' do
    user = FactoryGirl.create(:user)
    recipe1 = FactoryGirl.create(:recipe)
    review = FactoryGirl.create(:review, user: user, recipe: recipe1)
    sign_in(user)

    visit '/'

    click_on "VIEW RECIPES"

    click_on recipe1.name

    click_on "Delete Review"

    expect(page).to have_content("Review deleted")
    expect(page).to_not have_content(review.title)
  end
end
