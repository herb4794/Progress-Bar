class AddSubcategoryIdInProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :subcategory_id, :integer
    add_index :products, :subcategory_id
  end
end