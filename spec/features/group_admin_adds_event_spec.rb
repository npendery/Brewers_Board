require 'rails_helper'

feature 'user adds event to group', %{
  As a signed up user
  I want to add an event to a group
  So that other group members can see when we are brewing
} do
  # Acceptance Criteria
  # only owner of group can make events
  # owner must include all info for event form to submit

  scenario 'creates event succcessfully' do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, owner: user)

    sign_in(user)

    click_on 'View Brewing Groups'

    click_on group.name

    click_on "Add Event"

    fill_in "Title", with: "Brewing this weekend!"

    fill_in "Description", with: "Making two beers, here are the links! 1 2 "

    fill_in "Street", with: "1234 Tremont St"

    fill_in "City", with: "Cambridge"

    select "MA", from: "State"

    fill_in "Date", with: "10/12/15"

    select "2:00pm", from: "Time"

    click_on "Submit"

    expect(page).to have_content("Event added")
    expect(page).to have_content(group.name)
  end

  scenario 'creates event without title' do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, owner: user)

    sign_in(user)

    click_on 'View Brewing Groups'

    click_on group.name

    click_on "Add Event"

    fill_in "Title", with: ""

    fill_in "Description", with: "Making two beers, here are the links! 1 2 "

    fill_in "Street", with: "1234 Tremont St"

    fill_in "City", with: "Cambridge"

    select "MA", from: "State"
    
    fill_in "Date", with: "10/12/15"

    select "2:00pm", from: "Time"

    click_on "Submit"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("New Event")
  end
end
