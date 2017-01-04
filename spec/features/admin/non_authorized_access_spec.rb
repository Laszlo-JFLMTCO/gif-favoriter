require 'rails_helper'

RSpec.describe "Non-authorized access" do
  it "cannot view admin/users page if not signed in" do
    visit admin_users_path

    expect(current_path).to eq(login_path)
    expect(page).to have_content("You need to be signed in")
  end
  it "cannot view admin/users page if signed in with USER role" do
    create_list(:role, 3)
    user_role = Role.find_by(title: "user")
    test_password = "test1"
    user = User.create!(username: "test1", name: "test1", email: "test1", password: test_password,  site_role: user_role, role: user_role)

    visit root_path

    within(".navbar") do
      fill_in "username", with: user.username
      fill_in "password", with: test_password
      click_on "Sign In"
    end

    expect(current_path).to eq(user_path(user))
    expect(user.user?).to be_truthy
    expect(page).to have_content("Hello, #{user.name}")
    expect(page).to have_link("Logout", :href => logout_path)
    expect(page).not_to have_link("User List", :href => admin_users_path)
    expect(page).not_to have_link("Content Management", :href => editor_gifs_path)

    visit admin_users_path

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("ou were not authorized")
  end
  it "cannot view admin/users page if signed in with EDITOR role" do
    create_list(:role, 3)
    editor_role = Role.find_by(title: "editor")
    test_password = "test1"
    user = User.create!(username: "test1", name: "test1", email: "test1", password: test_password,  site_role: editor_role, role: editor_role)

    visit root_path

    within(".navbar") do
      fill_in "username", with: user.username
      fill_in "password", with: test_password
      click_on "Sign In"
    end

    expect(current_path).to eq(user_path(user))
    expect(user.editor?).to be_truthy
    expect(page).to have_content("Hello, #{user.name}")
    expect(page).to have_link("Logout", :href => logout_path)
    expect(page).not_to have_link("User List", :href => admin_users_path)
    expect(page).not_to have_link("Content Management", :href => editor_gifs_path)

    visit admin_users_path

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("You were not authorized")
  end
end