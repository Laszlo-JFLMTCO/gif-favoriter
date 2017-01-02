require 'rails_helper'

RSpec.describe "Category model" do
  describe "new instance" do
    it "can have NEW instance" do
      test_category = Category.new(title: "test")

      expect(test_category).to be_valid
    end
    it "can CREATE instance" do
      test_category = Category.create(title: "test")

      expect(test_category).to be_valid
    end
  end
  describe "validation" do
    it "cannot create two categories with the same title" do
      test_category = Category.create(title: "test")
      test_category2 = Category.create(title: "test")

      expect(test_category).to be_valid
      expect(test_category2).not_to be_valid
      expect(Category.count).to eq(1)
    end
  end
end