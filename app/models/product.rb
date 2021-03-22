class Product < ApplicationRecord
  belongs_to :wishlist

  validates :url, format: URI::regexp(%w[http https])
end
