class DashboardController < ApplicationController
  before_action :admin_user

  def index
    @bids = Bid.all.joins(:product, :user).order(product_id: :DESC, bid_offer_amount: :DESC)
  end

  def show
    @bids = Bid.where(product_id: params[:product_id])
  end

  def product
    @products = Product.all
  end

  def users
    @users = User.all
  end

end
