class Wishlist < ApplicationRecord
  has_many :products

  def self.default
    if Wishlist.last.nil?
      Wishlist.create!(title: 'one')
    end
  end
end
