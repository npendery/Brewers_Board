require 'rails_helper'

feature 'user adds message to group', %{
  As a signed up user
  I want to message a group
  So that I can tell the group members something
} do
  # Acceptance Criteria
  # user must be in the group
  # user must enter something in the message body

  scenario 'messages group succcessfully' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, owner: user2)

    sign_in(user1)

    click_on 'View Brewing Groups'

    click_on group.name

    click_on "Join Group"

    click_on "Message group"

    fill_in "Body", with: "Hi everyone, glad to be the group!"

    click_on "Submit"

    expect(page).to have_content("From: #{user1.username}")
  end

  scenario 'messages group unsucccessfully' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, owner: user2)

    sign_in(user1)

    click_on 'View Brewing Groups'

    click_on group.name

    click_on "Join Group"

    click_on "Message group"

    fill_in "Body", with: ""

    click_on "Submit"

    expect(page).to have_content("Message Body can't be blank")
  end
end
