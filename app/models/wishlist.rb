class Wishlist < ApplicationRecord
  has_many :products

  def self.default
    last or create!(title: 'one')
  end
end
