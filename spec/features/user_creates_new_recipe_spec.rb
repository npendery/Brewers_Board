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
    select "India Pale Ale", from: "Style"
    fill_in "Description", with: "Hoppy and dense"
    fill_in "Ingredients", with: "List \n of \n ingredients"
    fill_in "Instructions", with: "First \n Second \n Third"
    fill_in "Yield", with: "5 gallons"

    click_on "Create recipe"

    expect(page).to have_content("Recipe added!")
    expect(page).to have_content("HopperHead")
  end

  scenario 'create unsucccessful recipe, without name' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Recipe'

    fill_in "Name", with: ""
    select "India Pale Ale", from: "Style"
    fill_in "Description", with: "Hoppy and dense"
    fill_in "Ingredients", with: "List \n of \n ingredients"
    fill_in "Instructions", with: "First \n Second \n Third"
    fill_in "Yield", with: "5 gallons"

    click_on "Create recipe"

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'create unsucccessful recipe, without description' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Recipe'

    fill_in "Name", with: "HopperHead"
    select "India Pale Ale", from: "Style"
    fill_in "Description", with: ""
    fill_in "Ingredients", with: "List \n of \n ingredients"
    fill_in "Instructions", with: "First \n Second \n Third"
    fill_in "Yield", with: "5 gallons"

    click_on "Create recipe"

    expect(page).to have_content("Description can't be blank")
  end

  scenario 'create unsucccessful recipe, without Ingredients' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Recipe'

    fill_in "Name", with: "HopperHead"
    select "India Pale Ale", from: "Style"
    fill_in "Description", with: "Hoppy and dense"
    fill_in "Ingredients", with: ""
    fill_in "Instructions", with: "First \n Second \n Third"
    fill_in "Yield", with: "5 gallons"

    click_on "Create recipe"

    expect(page).to have_content("Ingredients can't be blank")
  end

  scenario 'create unsucccessful recipe, without Instructions' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Recipe'

    fill_in "Name", with: "HopperHead"
    select "India Pale Ale", from: "Style"
    fill_in "Description", with: "Hoppy and dense"
    fill_in "Ingredients", with: "List \n of \n ingredients"
    fill_in "Instructions", with: ""
    fill_in "Yield", with: "5 gallons"

    click_on "Create recipe"

    expect(page).to have_content("Instructions can't be blank")
  end

  scenario 'create unsucccessful recipe, without Yield' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Recipe'

    fill_in "Name", with: "HopperHead"
    select "India Pale Ale", from: "Style"
    fill_in "Description", with: "Hoppy and dense"
    fill_in "Ingredients", with: "List \n of \n ingredients"
    fill_in "Instructions", with: "First \n Second \n Third"
    fill_in "Yield", with: ""

    click_on "Create recipe"

    expect(page).to have_content("Yielder can't be blank")
  end

  scenario 'create unsucccessful recipe, without Style' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Recipe'

    fill_in "Name", with: "HopperHead"
    fill_in "Description", with: "Hoppy and dense"
    fill_in "Ingredients", with: "List \n of \n ingredients"
    fill_in "Instructions", with: "First \n Second \n Third"
    fill_in "Yield", with: "5 gallons"

    click_on "Create recipe"

    expect(page).to have_content("Style can't be blank")
  end
end
