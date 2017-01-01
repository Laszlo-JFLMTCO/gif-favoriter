require 'rails_helper'

RSpec.describe "Admin can view user list" do
  it "when signed in can see option to go to user list" do
    create_list(:role, 3)
    admin_role = Role.find_by(title: "admin")
    admin_password = "admin"
    admin_user = User.create!(username: "admin", name: "Admin", email: "admin", password: admin_password, site_role: admin_role, role: admin_role)

    visit root_path

    within(".navbar") do
      fill_in "username", with: admin_user.username
      fill_in "password", with: admin_password
      click_on "Sign In"
    end

    expect(current_path).to eq(user_path(admin_user))
    expect(page).to have_content("Hello, #{admin_user.name}")
    expect(page).to have_link("Logout", :href => logout_path)
    expect(page).to have_link("User List", :href => admin_users_path)
    expect(page).to have_link("Content Management", :href => admin_gifs_path)

    click_on "User List"

    expect(current_path).to eq(admin_users_path)
    expect(page).to have_content("User List")
  end  
end