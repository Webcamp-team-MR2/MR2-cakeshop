class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_id
      t.integer :price
      t.text :description
      t.integer :category_id
      t.boolean :sale_status, default: true

      t.timestamps
    end
  end
end
