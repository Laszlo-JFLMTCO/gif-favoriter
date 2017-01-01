require 'rails_helper'

RSpec.describe "Admin can edit user details" do
  it "when Admin is signed in" do
    create_list(:role, 3)
    admin_role = Role.find_by(title: "admin")
    user_role = Role.find_by(title: "user")
    admin_password = "admin"
    admin_user = User.create!(username: "admin", name: "Admin", email: "admin", password: admin_password, site_role: admin_role, role: admin_role)
    user = User.create!(username: "test1", name: "test1", email: "test1", password: "test1",  site_role: user_role, role: user_role)

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
    expect(page).to have_link(user.username)

    within("tr:last") do
      click_on "Edit"
    end

    expect(current_path).to eq(edit_admin_user_path(user))
    expect(find_field("user[username]").value).to eq(user.username)
    expect(find_field("user[name]").value).to eq(user.name)
    expect(find_field("user[email]").value).to eq(user.email)
    expect(find_field("user[password]").value).to eq(nil)

    expect(find_field("user[role]").value).to eq(user.role.id.to_s)

    new_name = "New Name"
    new_site_role = "admin"
    fill_in "user[name]", with: new_name
    select new_site_role, from: "user[role]"
    click_on "Update"

    expect(current_path).to eq(admin_user_path(user))
    expect(find_field("username", disabled: true).value).to eq(user.username)
    expect(find_field("name", disabled: true).value).to eq(new_name)
    expect(find_field("email", disabled: true).value).to eq(user.email)
    expect(find_field("role", disabled: true).value).to eq(new_site_role)
  end
end