require 'rails_helper'

RSpec.describe "Admin User login" do
  describe "Through Login page" do
    it "can Sign In with proper credentials" do
      create_list(:role, 3)
      admin_role = Role.find_by(title: "admin")
      admin_password = "admin"
      admin_user = User.create!(username: "admin", name: "Admin", email: "admin", password: admin_password, site_role: admin_role, role: admin_role)

      visit login_path

      within("#page-content") do
        fill_in "username", with: admin_user.username
        fill_in "password", with: admin_password
        click_on "Sign In"
      end

      expect(current_path).to eq(user_path(admin_user))
      expect(page).to have_content("Hello, #{admin_user.name}")
      expect(page).to have_link("Logout")
    end
    it "cannot Sign In with incorrect username" do
      create_list(:role, 3)
      admin_role = Role.find_by(title: "admin")
      admin_password = "admin"
      admin_user = User.create!(username: "admin", name: "Admin", email: "admin", password: admin_password, site_role: admin_role, role: admin_role)

      visit login_path

      within("#page-content") do
        fill_in "username", with: "somethingelse"
        fill_in "password", with: admin_password
        click_on "Sign In"
      end

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid login")
    end
    it "cannot Sign In with incorrect password" do
      create_list(:role, 3)
      admin_role = Role.find_by(title: "admin")
      admin_password = "admin"
      admin_user = User.create!(username: "admin", name: "Admin", email: "admin", password: admin_password, site_role: admin_role, role: admin_role)

      visit login_path

      within("#page-content") do
        fill_in "username", with: admin_user.username
        fill_in "password", with: "wrongpassword"
        click_on "Sign In"
      end

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid login")
    end
    it "cannot Sign In when both username and password is incorrect" do
      create_list(:role, 3)
      admin_role = Role.find_by(title: "admin")
      admin_password = "admin"
      admin_user = User.create!(username: "admin", name: "Admin", email: "admin", password: admin_password, site_role: admin_role, role: admin_role)

      visit login_path

      within("#page-content") do
        fill_in "username", with: "wrongusername"
        fill_in "password", with: "wrongpassword"
        click_on "Sign In"
      end

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid login")
    end
    it "can Sign In with proper credentials after login error" do
      create_list(:role, 3)
      admin_role = Role.find_by(title: "admin")
      admin_password = "admin"
      admin_user = User.create!(username: "admin", name: "Admin", email: "admin", password: admin_password, site_role: admin_role, role: admin_role)

      visit login_path

      within("#page-content") do
        fill_in "username", with: "wrongusername"
        fill_in "password", with: admin_password
        click_on "Sign In"
      end

      within("#page-content") do
        fill_in "username", with: admin_user.username
        fill_in "password", with: admin_password
        click_on "Sign In"
      end

      expect(current_path).to eq(user_path(admin_user))
      expect(page).to have_content("Hello, #{admin_user.name}")
      expect(page).to have_link("Logout")
      expect(page).not_to have_link("Sign In")
      expect(page).not_to have_link("Join")      
    end
  end
  describe "Through Navbar" do
    it "can Sign In with proper credentials" do
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
      expect(page).to have_link("Logout")
    end
    it "cannot Sign In with incorrect username" do
      create_list(:role, 3)
      admin_role = Role.find_by(title: "admin")
      admin_password = "admin"
      admin_user = User.create!(username: "admin", name: "Admin", email: "admin", password: admin_password, site_role: admin_role, role: admin_role)

      visit root_path

      within(".navbar") do
        fill_in "username", with: "somethingelse"
        fill_in "password", with: admin_password
        click_on "Sign In"
      end

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid login")
    end
    it "cannot Sign In with incorrect password" do
      create_list(:role, 3)
      admin_role = Role.find_by(title: "admin")
      admin_password = "admin"
      admin_user = User.create!(username: "admin", name: "Admin", email: "admin", password: admin_password, site_role: admin_role, role: admin_role)

      visit root_path

      within(".navbar") do
        fill_in "username", with: admin_user.username
        fill_in "password", with: "wrongpassword"
        click_on "Sign In"
      end

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid login")
    end
    it "cannot Sign In when both username and password is incorrect" do
      create_list(:role, 3)
      admin_role = Role.find_by(title: "admin")
      admin_password = "admin"
      admin_user = User.create!(username: "admin", name: "Admin", email: "admin", password: admin_password, site_role: admin_role, role: admin_role)

      visit root_path

      within(".navbar") do
        fill_in "username", with: "wrongusername"
        fill_in "password", with: "wrongpassword"
        click_on "Sign In"
      end

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid login")
    end
    it "can Sign In with proper credentials after login error" do
      create_list(:role, 3)
      admin_role = Role.find_by(title: "admin")
      admin_password = "admin"
      admin_user = User.create!(username: "admin", name: "Admin", email: "admin", password: admin_password, site_role: admin_role, role: admin_role)

      visit root_path

      within(".navbar") do
        fill_in "username", with: "wrongusername"
        fill_in "password", with: admin_password
        click_on "Sign In"
      end

      within(".navbar") do
        fill_in "username", with: admin_user.username
        fill_in "password", with: admin_password
        click_on "Sign In"
      end

      expect(current_path).to eq(user_path(admin_user))
      expect(page).to have_content("Hello, #{admin_user.name}")
      expect(page).to have_link("Logout")
      expect(page).not_to have_link("Sign In")
      expect(page).not_to have_link("Join")
    end
  end
end