require 'rails_helper'

RSpec.describe "Editor can add new GIF to database" do
  it "when logged in" do
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

    fill_in "search[keyword]", with: test_keyword
    click_on "Generate"

    expect(current_path).to eq(new_editor_gif_path)
    expect(find_field("gif[url]").value).not_to eq("")
    expect(find_field("gif[image_original_url]").value).not_to eq("")
    expect(find_field("gif[fixed_width_downsampled_url]").value).not_to eq("")
    expect(Gif.count).to eq(0)

    click_on "Add"

    expect(current_path).to eq(editor_gifs_path)
    expect(Gif.count).to eq(1)
  end
end