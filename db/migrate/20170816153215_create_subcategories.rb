class CreateSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :subcategories do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.belongs_to :category
      t.timestamps
    end
  end
end
