class AddKeywordColumnToGifs < ActiveRecord::Migration[5.0]
  def change
    add_column :gifs, :keyword, :string
  end
end
