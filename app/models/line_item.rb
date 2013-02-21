class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  attr_accessible :product
  attr_accessible :cart
  attr_accessible :quantity
  attr_accessible :product_id
end
