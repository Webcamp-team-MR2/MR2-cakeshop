class AddOrderCountToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :oder_count, :intrger
  end
end
