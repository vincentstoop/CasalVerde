class AddHeadingToParagraphs < ActiveRecord::Migration[5.0]
  def change
    add_column :paragraphs, :heading, :string
  end
end
