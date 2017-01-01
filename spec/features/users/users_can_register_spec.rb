require 'rails_helper'

RSpec.describe "New user can register" do
  it "when all required fields are filled" do
    create_list(:role, 3)

    visit new_user_path
    test_username = "test1"
    test_password = "test1"
    test_name = "test1"
    test_email = "test1"

    fill_in "user[username]", with: test_username
    fill_in "user[password]", with: test_password
    fill_in "user[name]", with: test_name
    fill_in "user[email]", with: test_email
    click_on "Register"

    test_user = User.find_by(username: test_username)

    expect(current_path).to eq(login_path)
    expect(test_user.user?).to be_truthy
    expect(test_user.admin?).to be_falsy
    expect(test_user.editor?).to be_falsy
  end
  it "and sign in after new registration" do
    create_list(:role, 3)

    visit new_user_path
    test_username = "test1"
    test_password = "test1"
    test_name = "test1"
    test_email = "test1"

    fill_in "user[username]", with: test_username
    fill_in "user[password]", with: test_password
    fill_in "user[name]", with: test_name
    fill_in "user[email]", with: test_email
    click_on "Register"

    test_user = User.find_by(username: test_username)

    within(".navbar")do
      fill_in "username", with: test_username
      fill_in "password", with: test_password
      click_on "Sign In"
    end

    expect(test_user.user?).to be_truthy
    expect(test_user.admin?).to be_falsy
    expect(test_user.editor?).to be_falsy
    expect(current_path).to eq(user_path(test_user))
    expect(page).to have_content("Hello, #{test_user.name}")
    expect(page).to have_link("Logout")
    expect(page).not_to have_link("Sign In")
    expect(page).not_to have_link("Join")
  end
end