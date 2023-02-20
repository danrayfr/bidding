require "test_helper"

class ProductTest < ActiveSupport::TestCase
  def setup
    @user = users(:danray)
    @product = @user.products.build(name: "Product Sample", description: "product sample", lowest_bid: 100, starting_bid: 101, bidding_expiration: "February 22, 2023", is_active: true)
  end 

  test "should be valid" do
    assert @product.valid?    
  end

  test "user id should be present" do
    @product.user_id = ""
    assert_not @product.valid?
  end

  test "name should be present" do
    @product.name = ""
    assert_not @product.valid?
  end

  test "description should be present" do
    @product.description = ""
    assert_not @product.valid?
  end

  test "lowest bid should be present" do
    @product.lowest_bid = ""
    assert_not @product.valid?
  end

  test "starting bid should be present" do
    @product.starting_bid = ""
    assert_not @product.valid?
  end

  test "bidding expiration should be present" do
    @product.description = ""
    assert_not @product.valid?
  end

  test "order should be the most recent" do 
    assert_equal products(:most_recent), Product.first
  end
end
