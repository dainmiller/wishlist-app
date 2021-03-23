require 'open-uri'

class CrawlerService < BaseService

  HOW_TO_FETCH_CONTENT =
   {
      ulta: {
        price: '.ProductPricingPanel'.freeze
      },
      amazon: {
        price: '.Amaa'
      }
   }

  def self.run_with product
    new(product)
  end

  def initialize product
    @product  = product
    @url      = product.url
    crawl
  end

  def crawl
    @site ||= extract_name
    @data ||= contents_of
    save! if @data
  end

  def save!
    @product.update(
      title: title,
      price: price
    )
  end

  def title
    @data.title
  end

  def price
    strategy_for :price do |strat|
      @data.css(strat).text()
    end
  end

  private

  def contents_of
    Nokogiri::HTML.parse(open(@url))
  end

  # TODO: extract to class
  def strategy_for element
    yield(
      HOW_TO_FETCH_CONTENT[
        @site.to_sym
      ][element.to_sym]
    )
  end

  def extract_name
    @url.split('.com')[0].split('.')[1]
  end
end
