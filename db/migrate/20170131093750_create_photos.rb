class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :photo_type_id
      t.string :photo_type_name

      t.timestamps
    end
  end
end
