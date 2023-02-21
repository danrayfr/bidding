class PagesController < ApplicationController
  def home
    # bids = Bid.al.joins(:product, :user)
    # @products = current_user.bids.joins(:product)
    @bids = current_user.bids.joins(:product).order(bid_offer_amount: :DESC)
  end
end