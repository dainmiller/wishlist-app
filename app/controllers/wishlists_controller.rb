class WishlistsController < ApplicationController
  def show
    @wishlist = Wishlist.last || Wishlist.create!(title: 'one')
    @product = Product.new
  end
end
