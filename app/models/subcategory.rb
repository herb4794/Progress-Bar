class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :products
  
  def name_with_category
    "#{category.try(:name)} / #{name}"
  end
end
