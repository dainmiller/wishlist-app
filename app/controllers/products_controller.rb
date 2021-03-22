class ProductsController < ApplicationController

  def index
  end

  def show
  end

  def create
    @wishlist = Wishlist.find params[:wishlist_id]
    @product = @wishlist.products.new product_params
    if @product.save
      redirect_to wishlist_path
    else
    end
  end

  def product_params
    params.require(:product).permit(:url, :title)
  end

end
