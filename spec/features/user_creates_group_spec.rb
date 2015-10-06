require 'rails_helper'

feature 'user creates group', %{
  As a signed up user
  I want to create new group
  So that I can see when the group is brewing
} do
  # Acceptance Criteria
  # user must specify all necessary information for the group to save
  # creater must be the admin of the group

  scenario 'creates group succcessfully' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Group'

    fill_in "Name", with: "BrewingBoys"
    fill_in "Location", with: "Cambridge, MA"
    fill_in "Description", with: "Weekly group to brew new beers"

    click_on "Create group"

    expect(page).to have_content("Group added.")
    expect(page).to have_content("BrewingBoys")
    expect(page).to have_content("Created by: #{user.username}")
  end

  scenario 'create unsucccessful group, without name' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Group'

    fill_in "Name", with: ""
    fill_in "Location", with: "Cambridge, MA"
    fill_in "Description", with: "Weekly group to brew new beers"

    click_on "Create group"

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'create unsucccessful group, without description' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Group'

    fill_in "Name", with: "BrewingBoys"
    fill_in "Location", with: "Cambridge, MA"
    fill_in "Description", with: ""

    click_on "Create group"

    expect(page).to have_content("Description can't be blank")
  end

  scenario 'create unsucccessful group, without location' do
    user = FactoryGirl.create(:user)

    sign_in(user)

    click_on 'Create Group'

    fill_in "Name", with: "BrewingBoys"
    fill_in "Location", with: ""
    fill_in "Description", with: "Weekly group to brew new beers"

    click_on "Create group"

    expect(page).to have_content("Location can't be blank")
  end
end
