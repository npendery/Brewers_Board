require 'rails_helper'

feature 'user creates recipe', %{
  As a signed up user
  I want to create new recipe
  So that other users can see my hoppy goodness
} do
  # Acceptance Criteria
  # user must specify all necessary information for the recipe to save
  #

  scenario 'creates recipe succcessfully' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Recipe'

    fill_in "Name", with: "HopperHead"
    fill_in "Description", with: "Hoppy and dense"
    fill_in "Malt/Grains", with: "List \n of \n ingredients"
    fill_in "Hops Schedule", with: "First \n Second \n Third"
    fill_in "Directions", with: "You do this"
    fill_in "Yeast", with: "Yeast selection"

    click_on "Create recipe"

    expect(page).to have_content("Recipe added.")
    expect(page).to have_content("HopperHead")
  end

  scenario 'create unsucccessful recipe, without name' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Recipe'

    fill_in "Name", with: ""
    fill_in "Description", with: "Hoppy and dense"
    fill_in "Malt/Grains", with: "List \n of \n ingredients"
    fill_in "Hops Schedule", with: "First \n Second \n Third"
    fill_in "Directions", with: "You do this"
    fill_in "Yeast", with: "Yeast selection"

    click_on "Create recipe"

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'create unsucccessful recipe, without description' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Recipe'

    fill_in "Name", with: "HopperHead"
    fill_in "Description", with: ""
    fill_in "Malt/Grains", with: "List \n of \n ingredients"
    fill_in "Hops Schedule", with: "First \n Second \n Third"
    fill_in "Directions", with: "You do this"
    fill_in "Yeast", with: "Yeast selection"

    click_on "Create recipe"

    expect(page).to have_content("Description can't be blank")
  end

  scenario 'create unsucccessful recipe, without Malt/Grains' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Recipe'

    fill_in "Name", with: "HopperHead"
    fill_in "Description", with: "Hoppy and dense"
    fill_in "Malt/Grains", with: ""
    fill_in "Hops Schedule", with: "First \n Second \n Third"
    fill_in "Directions", with: "You do this"
    fill_in "Yeast", with: "Yeast selection"

    click_on "Create recipe"

    expect(page).to have_content("Malt grains can't be blank")
  end

  scenario 'create unsucccessful recipe, without Hops Schedule' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Recipe'

    fill_in "Name", with: "HopperHead"
    fill_in "Description", with: "Hoppy and dense"
    fill_in "Malt/Grains", with: "List \n of \n ingredients"
    fill_in "Hops Schedule", with: ""
    fill_in "Directions", with: "You do this"
    fill_in "Yeast", with: "Yeast selection"

    click_on "Create recipe"

    expect(page).to have_content("Hops schedule can't be blank")
  end

  scenario 'create unsucccessful recipe, without Directions' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Recipe'

    fill_in "Name", with: "HopperHead"
    fill_in "Description", with: "Hoppy and dense"
    fill_in "Malt/Grains", with: "List \n of \n ingredients"
    fill_in "Hops Schedule", with: "First \n Second \n Third"
    fill_in "Directions", with: ""
    fill_in "Yeast", with: "Yeast selection"

    click_on "Create recipe"

    expect(page).to have_content("Directions can't be blank")
  end

  scenario 'create unsucccessful recipe, without Yeast' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Recipe'

    fill_in "Name", with: "HopperHead"
    fill_in "Description", with: "Hoppy and dense"
    fill_in "Malt/Grains", with: "List \n of \n ingredients"
    fill_in "Hops Schedule", with: "First \n Second \n Third"
    fill_in "Directions", with: "You do this"
    fill_in "Yeast", with: ""

    click_on "Create recipe"

    expect(page).to have_content("Yeast can't be blank")
  end
end
