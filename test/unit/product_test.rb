require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures  :products  # Test Fixtures
  
  test "the truth" do
    assert true
  end

  test "Product attributes must not be empty" do
	  product = Product.new
	  assert product.invalid?
	  assert product.errors[:title].any?
	  assert product.errors[:description].any?
	  assert product.errors[:price].any?
	  assert product.errors[:image_url].any?
  end

  test "Product price must be positive" do
	  product = Product.new(:title => "My Book Title",
						    :description => "yyy",
						    :image_url => "zzz.jpg")
#	  product.price = -1
#	  assert product.invalid?
#	  assert_equal "product.price = -1, must be greater than or equal to 0.01",
#		  product.errors[:price].join('; ')

	  product.price = 0
	  assert product.invalid?
	  assert_equal "product.price = 0, must be greater than or equal to 0.01",
		  product.errors[:price].join('; ')

	  product.price = 1
	  assert product.invalid?
  end

  def new_product(image_url)
	  Product.new(:title => "My Book Title",
				  :description => "yyy",
				  :price => 1,
				  :image_url => image_url)
  end

  test "image url" do
	  ok = %w{fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif}

	  bad = %w{fred.doc fred.gif/more fred.gif.more}
	  
	  ok.each do |name|
		  assert new_product(name).valid?, "#{name} shouldn't be invalid"
	  end

	  bad.each do |name|
		  assert new_product(name).valid?, "#{name} shouldn't be valid"
	  end
  end

  test "product is not valid without a unique title" do
	  product = Product.new(:title => products(:ruby).title,
						    :description => "yyy",
						    :price => 1,
						    :image_url => "fred.gif")
	  assert !product.save
	  assert_equal "has already been taken", product.errors[:title].join('; ')
  end

  # i18n
  test "product is not valid without a unique title - i18n" do
	  product = Product.new(:title => products(:ruby).title,
						    :description => "yyy",
						    :price => 1,
						    :image_url => "fred.gif")
	  assert product.save
	  assert_equal I18n.translate('activerecord.errors.messages.taken'), product.errors[:title].join('; ')
  end
end
