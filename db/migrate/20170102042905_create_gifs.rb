class CreateGifs < ActiveRecord::Migration[5.0]
  def change
    create_table :gifs do |t|
      t.string :url
      t.string :image_original_url
      t.string :fixed_width_downsampled_url

      t.timestamps null: false
    end
  end
end
