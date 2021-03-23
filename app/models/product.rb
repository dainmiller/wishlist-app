class Product < ApplicationRecord
  belongs_to :wishlist

  validates :url, format: URI::regexp(%w[http https])

  def crawl
   CrawlerService.run_with(self)
  end
end
