class AddPageRefToCarousel < ActiveRecord::Migration[5.0]
  def change
    add_reference :carousels, :page, foreign_key: true
  end
end
