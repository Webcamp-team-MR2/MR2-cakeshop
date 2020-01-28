class AddItemCountToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :item_count, :intrger
  end
end
