class StoreController < ApplicationController
  def index
	  @products = Product.all
  end
end
