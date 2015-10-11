require 'rails_helper'

feature 'user edits recipe', %{
  As a signed up user
  I want to edit my recipe
  So that other users can see my hoppy goodness edits
} do
  # Acceptance Criteria
  # I must provide valid information
  # I must be presented with errors if I fill out the form incorrectly
  # I must be able to get to the edit page from the question details pag
  # I must be able to edit page, while other users cant

  scenario 'edits own recipe description succcessfully' do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)

    sign_in(user)

    click_on 'VIEW RECIPES'

    click_on recipe.name

    click_on "Edit Recipe"

    fill_in "Description", with: "Hoppy with a citrus bite"

    click_on "Update recipe"

    expect(page).to have_content("Recipe updated.")
    expect(page).to have_content("Hoppy with a citrus bite")
  end

  scenario 'edits own recipe unsucccessfully' do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)

    sign_in(user)

    click_on 'VIEW RECIPES'

    click_on recipe.name

    click_on "Edit Recipe"

    fill_in "Description", with: ""

    click_on "Update recipe"

    expect(page).to have_content("Description can't be blank")
  end

  scenario 'user cannot edit another persons recipe' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user1)

    sign_in(user2)

    click_on 'VIEW RECIPES'

    click_on recipe.name

    expect(page).to_not have_content("Edit Recipe")
  end
end
