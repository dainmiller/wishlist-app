class CrawlerService < BaseService

  HOW_TO_FETCH_CONTENT = {
    ulta: {
      title: 'title',
      price: '.ProductPricingPanel'.freeze
    },
    amazon: {
      price: ''
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
    @data ||= all_contents
    save! if @data
  end

  def save!
    @product.update(
      title: title,
      price: price
    )
  end

  def title
    strategy_for :title do |strat|
      @data.send(strat)
    end
  end

  def price
    strategy_for :price do |strat|
      # TODO: Refactor to be generic
      if @site == 'ulta'
        @data.css(strat).text().split('e')[1]
      end
    end
  end

  private

  def all_contents
    Nokogiri::HTML(HTTParty.get(@url).body)
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
