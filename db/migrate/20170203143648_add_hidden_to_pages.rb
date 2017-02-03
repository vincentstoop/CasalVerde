class AddHiddenToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :hidden, :boolean
  end
end
