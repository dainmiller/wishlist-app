feature "Guest adds product to wishlist" do

  before(:each) do
    @wishlist = Wishlist.default
  end

  scenario "expects a default wishlist to exist" do
    visit wishlist_url @wishlist
    expect(page).to_not be_nil
  end

  scenario "adds product to wishlist with url" do
    visit wishlist_url @wishlist
    fill_in "product[url]", with: FakeUlta.new.product_url
    click_on "commit"
    expect(page).to have_text FakeUlta.new.product_url
  end

  scenario "doesn't add product to wishlist if url broken" do
    visit wishlist_url @wishlist
    not_changed_page = page
    fill_in "product[url]", with: FakeUlta.new.not_a_product_url
    click_on "commit"
    expect(page).to eq(not_changed_page)
  end

end
