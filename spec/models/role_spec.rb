require 'rails_helper'

RSpec.describe "Role model" do
  describe "new instance" do
    it "can have a NEW instance" do
      user_role = Role.new(
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

      expect(user_role).to be_valid
    end
  end
  describe "validations" do
    it "can CREATE a new role when all fields are filled in" do
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

      expect(user_role).to be_valid
    end
    it "cannot create two roles with same title" do
      user_role = Role.create!(
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
      user_role2 = Role.create(
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

      expect(user_role).to be_valid
      expect(user_role2).not_to be_valid
    end
  end
end