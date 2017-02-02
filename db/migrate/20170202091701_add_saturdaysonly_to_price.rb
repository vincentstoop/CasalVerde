class AddSaturdaysonlyToPrice < ActiveRecord::Migration[5.0]
  def change
    add_column :prices, :saturdays_only, :boolean, default: false
  end
end
