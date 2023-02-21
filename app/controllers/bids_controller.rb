class BidsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  def edit
    @product = Product.find(params[:product_id])
  end
  
  def create
    @bid = current_user.bids.build(bid_params)
    @bid.product_id = params[:product_id]

    time_remaining = @bid.product.bidding_expiration.to_time - Time.now

    if @bid.bid_offer_amount.present? && @bid.bid_offer_amount >= @bid.product.lowest_bid && time_remaining > 0
      if @bid.save
        redirect_to products_path, notice: "Bid saved successfully."
      end
    end
  end

  def update
    if @bid.update(bid_params)
      redirect_to root_path, notice: "Bid updated successfully."
    else 
      render "edit", status: :unprocessable_entity
    end
  end

  private 

  def set_bid
    @bid = Bid.find(params[:id])
  end

  def bid_params
    params.require(:bid).permit(:bid_offer_amount, :user_id, :product_id)
  end
end
