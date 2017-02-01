class AddNameToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :name, :string
  end
end
