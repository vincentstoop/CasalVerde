class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.string :first_name
      t.string :last_name
      t.string :title
      t.integer :phone
      t.string :email
      t.string :street_name
      t.string :street_number
      t.string :city
      t.string :zip_code
      t.integer :people
      t.decimal :total_price
      t.boolean :confirmed
      t.boolean :paid

      t.timestamps
    end
  end
end
