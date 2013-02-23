class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :description, :image_url, :title, presence: true
end
