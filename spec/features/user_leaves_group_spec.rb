require 'rails_helper'

feature 'user leaves group', %{
  As a signed up user
  I want to leave a group
  So that I dont get messages fro the group
} do
  # Acceptance Criteria
  # user must click join group

  scenario 'leaves group succcessfully' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, owner: user2)

    sign_in(user1)

    click_on 'VIEW GROUPS'

    click_on group.name

    click_on "Join Group"

    click_on "Leave Group"

    expect(page).to have_content("Left group.")
    expect(page).to have_content("Brewing Groups")
  end
end
