class AddReferenceCategoryToGifs < ActiveRecord::Migration[5.0]
  def change
    add_reference :gifs, :category, index: true, foreign_key: true
  end
end
