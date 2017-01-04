require 'rails_helper'

RSpec.describe "User model" do
  describe "new instance" do
    it "can have a NEW instance" do
      user_role = Role.create(
        title: "user",
        can_change_roles: false,
        can_add_user: false,
        can_delete_user: false,
        can_add_gif: false,
        can_delete_gif: false,
        can_create_roles: false,
        can_delete_roles: false,
        user_role_id: 0
      )
      user = User.new(username: "test1", name: "test1", email: "test1", password: "test1")
      user.role = user_role
      user.save

      expect(user).to be_valid
    end
  end
  describe "validations" do
    it "can CREATE a new user when all fields are filled in" do
      user_role = Role.create(
        title: "user",
        can_change_roles: false,
        can_add_user: false,
        can_delete_user: false,
        can_add_gif: false,
        can_delete_gif: false,
        can_create_roles: false,
        can_delete_roles: false,
        user_role_id: 0
      )
      user = User.new(username: "test1", name: "test1", email: "test1", password: "test1")
      user.role = user_role
      user.save

      expect(user).to be_valid
    end
    it "with default value USER for site_role" do
      user_role = Role.create(
        title: "user",
        can_change_roles: false,
        can_add_user: false,
        can_delete_user: false,
        can_add_gif: false,
        can_delete_gif: false,
        can_create_roles: false,
        can_delete_roles: false,
        user_role_id: 0
      )
      user = User.new(username: "test1", name: "test1", email: "test1", password: "test1")
      user.role = user_role
      user.save

      expect(user.user?).to be_truthy
      expect(user.admin?).to be_falsy
      expect(user.editor?).to be_falsy
    end
    it "cannot create two users with same username" do
      user = User.create(username: "test1", name: "test1", email: "test1", password: "test1")
      user2 = User.create(username: "test1", name: "test2", email: "test2", password: "test2")

      expect(user2).not_to be_valid
    end
  end
  describe "associations" do
    it "can get role" do
      user_role = Role.create(
        title: "user",
        can_change_roles: false,
        can_add_user: false,
        can_delete_user: false,
        can_add_gif: false,
        can_delete_gif: false,
        can_create_roles: false,
        can_delete_roles: false,
        user_role_id: 0
      )
      user = User.new(username: "test1", name: "test1", email: "test1", password: "test1")
      user.role = user_role
      user.save
      
      expect(user.role).to be_valid
    end
  end
end