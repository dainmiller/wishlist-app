class Wishlist < ApplicationRecord
  has_many :products

  def self.default
    Wishlist.last or Wishlist.create!(title: 'one')
  end
end
