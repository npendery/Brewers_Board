require 'rails_helper'

feature 'user joins group', %{
  As a signed up user
  I want to join a group
  So that I can connect with the group members
} do
  # Acceptance Criteria
  # user must click join group

  scenario 'joins group succcessfully' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, owner: user2)

    sign_in(user1)

    click_on 'VIEW GROUPS'

    click_on group.name

    click_on "Join Group"

    expect(page).to have_content("You have joined this group.")
    expect(page).to have_content(group.name)
  end
end
