require 'rails_helper'
require 'giphy'

RSpec.describe "Giphy class" do
  describe "creating instance" do
    it "with default settings" do
      test_giphy = Giphy.new

      expect(test_giphy).not_to eq(nil)
    end
  end
  describe "methods" do
    it "can provide random giphy details" do
      test_giphy = Giphy.new
      random_giphy = test_giphy.random
      expect(random_giphy).not_to eq(nil)
      expect(random_giphy["url"]).not_to eq("")
    end
  end

end