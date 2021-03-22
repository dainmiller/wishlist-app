require 'open-uri'

class CrawlerService < BaseService

  HOW_TO_FETCH_CONTENT =
    {
      ulta: {
        price: '.ProductPricingPanel'.freeze
      },
      amazon: {
        price: ''
      }
    }

  def self.crawl(url:)
    new url
  end

  def initialize url
    @site = extract_name_from(url: url)
    @data = contents_of url
  end

  def contents_of url
    Nokogiri::HTML.parse(open(url))
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

  # TODO: extract to class
  def strategy_for element
    yield(
      HOW_TO_FETCH_CONTENT[
        @site.to_sym
      ][element.to_sym]
    )
  end

  def extract_name_from(url:)
    url.split('.com')[0].split('.')[1]
  end
end
