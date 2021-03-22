describe Product do

  context "validations" do

    context "fail" do
      it "refuses to save without URL" do
        product = Wishlist.new.products.new
        product.valid?
        expect(product.errors.errors.map(&:attribute)).to eq([:url])
      end
      it "refuses to save without a wishlist" do
        product = Product.new(url: "https://google.com")
        product.valid?
        expect(product.errors.errors.map(&:attribute)).to eq([:wishlist])
      end
      it "refuses to save without both a wishlist and URL" do
        product = Product.new
        product.valid?
        expect(
          product.errors.errors.map(&:attribute)
        ).to eq([:wishlist, :url])
      end
      it "refuses to save without a valid URL" do
        product = Wishlist.new.products.new(url: 'something unsafe')
        product.valid?
        expect(product.errors.errors.map(&:attribute)).to eq([:url])
      end
    end

    context "pass" do
      it "persists the validated attributes" do
        product = Wishlist.new.products.new(url: 'https://google.com')
        product.valid?
        expect(product.errors.errors.map(&:attribute).count).to eq(0)
      end
    end

  end

  context ":after_create" do
    before(:each) do
      @product = Wishlist.new.products.new(url: FakeUlta.url)
      @crawler = CrawlerService.new(url: FakeUlta.url)
      @crawler.crawl
    end
    it "starts crawling the product URL" do
      expect(CrawlerService).to receive(:run_with).with(FakeUlta.url)
      @product.save
    end

    context "crawler started" do
      it "should find the product title" do
        expect(@crawler.title).to_not be_nil
      end
      it "should find the product price" do
        expect(@crawler.price).to_not be_nil
      end

      context "when found product details" do
        it "persists to the database" do
          # TODO: how will I implement this?
        end
      end
    end

  end
end

