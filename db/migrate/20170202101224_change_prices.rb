class ChangePrices < ActiveRecord::Migration[5.0]
  def change
    change_column :prices, :nightly_price, :decimal, precision: 7, scale: 2
    change_column :prices, :extra_price, :decimal, precision: 7, scale: 2
  end
end
