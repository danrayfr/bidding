require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @product = products(:katana)
    @user = users(:danray)
    @non_admin = users(:genie)
  end
  test "should get index" do
    sign_in @user
    get products_url
    assert_response :success
  end

  test "should get show" do
    sign_in @user
    get products_url(@product)
    assert_response :success
  end
  
  test "should redirect create when user not an admin" do
    sign_in @non_admin
    assert_no_difference 'Product.count' do
      post products_path, params: { product: { name: @product.name, description: @product.description, lowest_bid: @product.lowest_bid, starting_bid: @product.starting_bid, bidding_expiration: @product.bidding_expiration, is_active: @product.is_active, user_id: @non_admin.id}}
    end
    assert_redirected_to root_url
  end

  test "should redirect update when user not an admin" do
    sign_in @non_admin
    assert_no_difference 'Product.count' do
      patch product_path(@product), params: { product: { name: "edited name", description: "edited description", lowest_bid: @product.lowest_bid, starting_bid: @product.starting_bid, bidding_expiration: @product.bidding_expiration, is_active: @product.is_active, user_id: @non_admin.id}}
    end
    assert_redirected_to root_url
  end

  test "should redirect delete when user not an admin" do
    sign_in @non_admin
    assert_no_difference 'Product.count' do
      delete product_path(@product)
    end
    assert_redirected_to root_url
  end
end
