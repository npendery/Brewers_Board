require 'rails_helper'

feature 'user deletes recipe', %{
  As a signed up user
  I want to delete my recipe
  So that other users cant see my recipe
} do
  # Acceptance Criteria
  # I must be able to delete recipe, while other users cant

  scenario 'deletes own recipe description succcessfully' do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)

    sign_in(user)

    click_on 'View all user recipes'

    click_on recipe.name

    click_on "Delete Recipe"

    expect(page).to have_content("Recipe deleted.")
    expect(page).to_not have_content(recipe.name)
  end

  scenario 'user cannot delete another persons recipe' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user1)

    sign_in(user2)

    click_on 'View all user recipes'

    click_on recipe.name

    expect(page).to_not have_content("Delete Recipe")
  end
end
