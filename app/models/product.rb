class Product < ApplicationRecord
  belongs_to :subcategory
  mount_uploader :image_url, ImageUploader
end
