require 'giphy'

class Editor::GifsController < ApplicationController
  before_action :confirm_editor

  def index
    @gifs = Gif.all
  end

  def new
    new_random_giphy = Giphy.new.random
    @gif = Gif.new
    @gif.url = new_random_giphy["url"] 
    @gif.image_original_url = new_random_giphy["image_original_url"] 
    @gif.fixed_width_downsampled_url = new_random_giphy["fixed_width_downsampled_url"] 
    @gif.keyword = params["search"]["keyword"]
  end

  def create
    gif = Gif.new(gif_params)
    gif.category = Category.find_or_create_by(title: gif.keyword)
    gif.save
    redirect_to editor_gifs_path
  end

  def destroy
    Gif.destroy(params[:id])
    redirect_to editor_gifs_path
  end

  private

  def gif_params
    params.require(:gif).permit(:url, :image_original_url, :fixed_width_downsampled_url, :keyword)
  end

  def confirm_editor
    if current_user
      if current_user.admin? || current_user.editor?
      else
        flash["danger"] = "You were not authorized to view that page, here is your page instead."
        redirect_to user_path(current_user)
      end
    else
      flash["danger"] = "You need to be signed in to view that page..."
      redirect_to login_path
    end
  end
end