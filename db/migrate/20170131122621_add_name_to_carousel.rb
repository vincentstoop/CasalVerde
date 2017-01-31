class AddNameToCarousel < ActiveRecord::Migration[5.0]
  def change
    add_column :carousels, :name, :string
  end
end
