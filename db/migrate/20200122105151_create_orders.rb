class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :postal_code
      t.text :address
      t.string :full_name
      t.integer :order_status, default: 0
      t.integer :pay_method
      t.integer :shipping_fee

      t.timestamps
    end
  end
end
