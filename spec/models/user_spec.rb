require 'rails_helper'

RSpec.describe "User model" do
  describe "new instance" do
    it "can have a new instance" do
      user = User.new

      expect(user).to be_valid
    end
    it "can create a new row within the database" do
      user = User.create()

      expect(user).to be_valid
    end
    it "with default value USER for role" do
      user = User.create()

      expect(user.role).to eq("user")
    end
  end
end