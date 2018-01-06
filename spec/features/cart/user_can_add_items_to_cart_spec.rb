describe "Visitor sees item they like" do
  describe "they click on add item to cart" do
    before(:each) do
      @item = create(:item)
    end

    it "user sees message that item is added to cart" do
      visit items_path

      click_button "Add to Cart"

      expect(page).to have_content("You now have 1 #{@item.title} in your cart!")
    end

    it "correctly increments for multiple items" do
      visit item_path(@item)

      click_button "Add to Cart"

      expect(page).to have_content("You now have 1 #{@item.title} in your cart!")

      visit item_path(@item)

      click_button "Add to Cart"

      expect(page).to have_content("You now have 2 #{@item.title}s in your cart!")
    end
  end
end
