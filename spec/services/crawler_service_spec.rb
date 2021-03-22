describe "Crawler service" do

  context "when fetching url contents" do
    before(:each) do
      @crawler_service = CrawlerService.crawl(
        url: FakeUlta.new.url
      )
    end

    it "should find a product title" do
      expect(@crawler_service.title).to include(FakeUlta.new.title)
    end

    it "should find a product price" do
      expect(@crawler_service.price).to include(FakeUlta.new.price)
    end

    context "and when a URL is broken" do
      xit "should silently fail crawling" do
      end
    end
  end

  context "when ready to save data" do
    xit "should be passed a table to persist to" do
    end

    xit "should be passed a data store strategy" do
    end

    xit "should successfully save the data" do
    end
  end

end
