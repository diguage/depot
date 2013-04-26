class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id
  belongs_to :product
  belongs_to :cart
  attr_accessible :product
  attr_accessible :quantity
  
  def total_price
	  product.price * quantity
  end
end
