class AddSubtotalToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :subtotal, :integer
  end
end
