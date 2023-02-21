require "test_helper"

class BidTest < ActiveSupport::TestCase
  def setup
    @user = users(:danray)
    @product = products(:katana)
    @bid = @user.bids.build(bid_offer_amount: 100, product_id: @product.id)
  end

  test "should be valid" do 
    assert @bid.valid?
  end

  test "should not be empty" do
    @bid.bid_offer_amount = ""
    assert_not @bid.valid?
  end

end
