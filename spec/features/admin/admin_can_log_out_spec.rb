require 'rails_helper'

RSpec.describe "Admin user logout" do
  it "shown after successful login Admin can log out" do
    create_list(:role, 3)
    admin_role = Role.find_by(title: "admin")
    admin_user = User.create!(username: "admin", name: "Admin", email: "admin", password: "admin", site_role: admin_role, role: admin_role)

    visit welcome_index_path

    fill_in "username", with: admin_user.username
    fill_in "password", with: "admin"
    click_on "Sign In"

    click_on "Logout"

    expect(current_path).to eq(login_path) 
  end
end