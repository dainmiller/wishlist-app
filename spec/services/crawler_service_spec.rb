describe "Crawler service" do

  before(:each) do
    @crawler_service = CrawlerService.new(
      Wishlist.create.products.create(
        url: FakeUlta.url
      )
    )
    @crawler_service.crawl
  end

  context "when fetching url contents" do

    it "should find a product title" do
      expect(@crawler_service.title).to include(FakeUlta.title)
    end

    it "should find a product price" do
      expect(@crawler_service.price).to include(FakeUlta.price)
    end

    context "and when a URL is broken" do
      it "should explicitly return url error msg" do
        expect { CrawlerService.new(
          Wishlist.create.products.create(
            url: "broken url"
          )
        ).crawl }.to raise_error(URI::InvalidURIError)
      end
    end
  end

  context "when ready to save data" do
    it "should call save after crawling" do
      crawler = CrawlerService.new(
        Wishlist.create.products.create!(
          url: FakeUlta.url
        )
      )
      expect(crawler).to receive(:save!)
      crawler.crawl
    end
    it "should be persisted to the db" do
      CrawlerService.new(
        Wishlist.create.products.create!(
          url: FakeUlta.url
        )
      ).crawl
      expect(Wishlist.last.products.last.title).to include(FakeUlta.title)
    end
  end

end
