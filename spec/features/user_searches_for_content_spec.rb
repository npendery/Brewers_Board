require 'rails_helper'

feature 'user searches for content', %{
  As a signed up user
  I want to search the database for content
  So that I can see if it is there
} do

  scenario 'searches for recipe in database' do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe)

    sign_in(user)

    fill_in "search", with: recipe.name
    click_on "Search"

    expect(page).to have_content("Search Results")

    expect(page).to have_content(recipe.name)
    expect(page).to_not have_content("No Results")
  end

  scenario 'searches for recipe not in database' do
    user = FactoryGirl.create(:user)
    sign_in(user)

    fill_in "search", with: "Pilsner"
    click_on "Search"

    expect(page).to have_content("Search Results")
    expect(page).to have_content("No Results")
  end

  scenario 'searches for group in database' do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group)

    sign_in(user)

    fill_in "search", with: group.name
    click_on "Search"
    expect(page).to have_content("Search Results")

    expect(page).to have_content(group.name)
    expect(page).to_not have_content("No Results")
  end

  scenario 'searches for event in group' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, owner: user2)
    event = FactoryGirl.create(:event, group: group, user: user2)

    sign_in(user)

    click_on 'View Brewing Groups'

    click_on group.name

    click_on "Join Group"

    click_on "BrewersBoard"

    fill_in "search", with: event.title
    click_on "Search"
    expect(page).to have_content("Search Results")
    expect(page).to have_content(event.title)
    expect(page).to_not have_content("No Results")
  end
end
