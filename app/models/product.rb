class Product < ApplicationRecord
  belongs_to :wishlist

  validates :url, format: URI::regexp(%w[http https])

  after_create :crawl

  def crawl
    CrawlerService.run_with self.url
  end
end
