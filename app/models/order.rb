class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type
end
