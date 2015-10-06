require 'rails_helper'

feature 'admin visits users index', %{
  As an admin
  I want to visit the users index
  So that I can see and modify all users
} do

  # Acceptance Criteria:
  # * Admin must see list of all users
  # * Visitor must not be able to delete users
  # * Admin can delete users
  # * Admin can change 'user' to 'admin'

  scenario 'admin visits users index' do
    user1 = FactoryGirl.create(:user, admin: true)
    user2 = FactoryGirl.create(:user)
    sign_in(user1)
    visit users_path

    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.username)
    expect(page).to have_content("Delete user")
    expect(page).to have_content("Make admin")
  end

  scenario 'member fails to see admin functions' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit users_path

    expect(page).to_not have_content("Delete user")
    expect(page).to_not have_content("Make admin")
  end

  scenario 'admin deletes user' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, admin: true)

    sign_in(user2)
    visit users_path

    expect(page).to have_content(user2.username)
# save_and_open_page
#     find ("a[href$="ABC"]:first") do
#       click_link "Delete user"
#     end

    find(:xpath, "//a[@href='/users/#{user1.id}']").click

    expect(page).to_not have_content(user1.username)
  end

  scenario 'admin makes another user an admin' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, admin: true)

    sign_in(user2)
    visit users_path

    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.username)

    within (".member-list") do
      click_link "Make Admin"
    end

    within (".admin-list") do
      expect(page).to have_content(user1.username)
    end
  end
end
