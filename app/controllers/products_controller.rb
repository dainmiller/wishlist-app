class ProductsController < ApplicationController

  def index
    @wishlist = Wishlist.last || Wishlist.create!(title: 'one')
    @product = Product.new
  end

  def show
  end

  def create
    @wishlist = Wishlist.find params[:wishlist_id]
    @product = @wishlist.products.new product_params
    if @product.save
      @product.crawl
      redirect_to wishlist_path
    else
    end
  end

  def product_params
    params.require(:product).permit(:url, :title)
  end

end
