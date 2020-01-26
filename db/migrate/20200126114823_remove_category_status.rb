class RemoveCategoryStatus < ActiveRecord::Migration[5.2]
  def change
 change_column :categories, :category_status, :integer
end
end
