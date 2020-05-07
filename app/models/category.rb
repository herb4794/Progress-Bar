class Category < ApplicationRecord
  has_many :subcategories
  has_many :products, through: :subcategories
end
