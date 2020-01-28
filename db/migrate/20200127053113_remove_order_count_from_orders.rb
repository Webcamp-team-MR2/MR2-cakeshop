class RemoveOrderCountFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :oder_count, :intrger
  end
end
