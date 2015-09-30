require 'rails_helper'

feature 'user views recipes', %{
  As a signed up user
  I want to view all recipes
  So that I can pick a beer to make
} do
  # Acceptance Criteria
  # user must be able to see all recipes created
  #

  scenario 'views recipe succcessfully' do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe)
    sign_in(user)

    visits '/'

    click_on "View all user recipes"

    click_on "Submit"

    expect(page).to have_content("Recipe added.")
    expect(page).to have_content("HopperHead")
  end
