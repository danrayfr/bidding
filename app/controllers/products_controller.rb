class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :admin_user, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index 
    @products = Product.all
  end

  def show
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)

    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else 
      render "new", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: "Product was successfully deleted."
  end

  private 

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :lowest_bid, :starting_bid, :bidding_expiration, :is_active, :user_id)
  end
end
