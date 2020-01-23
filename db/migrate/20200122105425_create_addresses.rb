class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :postal_code
      t.text :address
      t.string :full_name

      t.timestamps
    end
  end
end
