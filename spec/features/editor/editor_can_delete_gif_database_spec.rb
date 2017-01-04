require 'rails_helper'

RSpec.describe "Editor can add new GIF to database" do
  it "when logged in" do
    test_category = Category.create(title: "test")
    test_gif = Gif.new(url: "test", image_original_url: "test", fixed_width_downsampled_url: "test")
    test_gif.category = test_category
    test_gif.save
    create_list(:role, 3)
    editor_role = Role.find_by(title: "editor")
    editor_password = "editor"
    editor_user = User.create!(username: "editor", name: "Editor", email: "editor", password: editor_password, site_role: editor_role, role: editor_role)
    test_keyword = "funny"

    visit root_path

    within(".navbar") do
      fill_in "username", with: editor_user.username
      fill_in "password", with: editor_password
      click_on "Sign In"
    end

    visit editor_gifs_path
    expect(Gif.count).to eq(1)

    click_on "Delete"

    expect(current_path).to eq(editor_gifs_path)
    expect(Gif.count).to eq(0)
  end
end