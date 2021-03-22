class AddWishlistIdToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :wishlist, null: false, foreign_key: true
  end
end
