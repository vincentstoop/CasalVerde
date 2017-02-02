class AddServiceCostsToPrice < ActiveRecord::Migration[5.0]
  def change
    add_column :prices, :service_costs, :decimal, precision: 7, scale: 2
  end
end
