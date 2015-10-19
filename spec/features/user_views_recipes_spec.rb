require 'rails_helper'

feature 'user views recipes', %{
  As a signed up user
  I want to view all recipes
  So that I can pick a beer to make
} do
  # Acceptance Criteria
  # user must be able to see all recipes created
  # most recent recipies show first

  scenario 'views recipe succcessfully' do
    user = FactoryGirl.create(:user)
    recipe1 = FactoryGirl.create(:recipe)
    recipe2 = FactoryGirl.create(:recipe)
    sign_in(user)

    visit '/'

    click_on "VIEW RECIPES"

    expect(page).to have_content(recipe1.name)
    expect(page).to have_content(recipe1.style)
    expect(page).to have_content(recipe2.name)
    expect(page).to have_content(recipe2.style)
    expect(recipe2.name).to be > recipe1.name
  end
end
