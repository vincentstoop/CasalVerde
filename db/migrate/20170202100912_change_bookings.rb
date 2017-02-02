class ChangeBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :phone, :string
    change_column :bookings, :total_price, :decimal, precision: 7, scale: 2
    change_column :bookings, :total_price, :decimal, precision: 7, scale: 2  
  end
end
