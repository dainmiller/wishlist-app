describe Product do

  context "validations" do

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

end
