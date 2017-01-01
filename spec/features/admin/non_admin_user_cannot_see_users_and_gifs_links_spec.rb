require 'rails_helper'

RSpec.describe"Non admin user" do
  it "cannot see link to User List and Content Management" do
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
    expect(page).to have_content("Hello, #{user.name}")
    expect(page).to have_link("Logout", :href => logout_path)
    expect(page).not_to have_link("User List", :href => admin_users_path)
    expect(page).not_to have_link("Content Management", :href => admin_gifs_path)
  end
end