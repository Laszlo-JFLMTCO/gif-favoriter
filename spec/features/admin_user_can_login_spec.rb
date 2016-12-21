require 'rails_helper'

RSpec.describe "Admin User login" do
  it "can log in" do
    admin_user = User.create(username: "admin", name: "Admin", password: "admin", role: "admin")

    visit login_path

    fill_in "username", with: admin_user.username
    fill_in "password", with: "admin"
    click_on "Login"

    expect(current_path).to eq(user_path(admin_user))
    expect(page).to have_content("Hello, #{admin_user.name}")
  end
end