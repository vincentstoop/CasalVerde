class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :image
      t.string :photo_page_type
      t.integer :photo_page_id

      t.timestamps
    end
  end
end
