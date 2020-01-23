class AddFirstNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :last_name_kana, :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :postal_code, :string
    add_column :customers, :address, :text
    add_column :customers, :tel, :string
    add_column :customers, :customer_status, :boolean, default: true
  end
end
