describe "User visits item show page" do

  before(:each) do
    @user = create(:user)
    visit "/login"

    fill_in "username", with: "bob"
    fill_in "password", with: 'password'
    click_on "Log In"
  end
  
  it "can see item details" do
    item = create(:item)

    visit item_path(item)

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price_in_dollars)
  end

  it "can add item to cart if item status is active" do
    item = create(:item)

    visit item_path(item)

    click_button "Add to Cart"

    expect(page).to have_content("You now have 1 #{item.title} in your cart!")

    visit item_path(item)

    click_button "Add to Cart"

    expect(page).to have_content("You now have 2 #{item.title}s in your cart!")
  end

  it "cannot add item to cart if item status is retired" do
    item = create(:item, status: 0)

    visit item_path(item)

    expect(item.active?).to be_falsy
    expect(page).to have_content("Item Retired")
    expect(page).to have_button "Add to Cart", disabled: true
  end

  it "cannot add item to cart if item status is out_of_stock" do
    item = create(:item, status: 2)

    visit item_path(item)

    expect(item.active?).to be_falsy
    expect(page).to have_content("Out of Stock")
    expect(page).to have_button "Add to Cart", disabled: true
  end
end
