describe "Visitor views their cart" do
    before(:each) do
      @item = create(:item)
    end

    it "visitor can see the quantity of items in cart" do
      visit items_path

        click_button "Add to Cart"

        click_link ("1")

        expect(page).to have_selector("input")
    end

    it "visitor can change the quantity of items in a cart " do
      visit items_path

      click_button "Add to Cart"

      click_link ("1")

      fill_in "item[quantity]", with: 4

      click_on "Update"

      expect(page).to have_content("You now have 4 cool mittens in your cart!")
    end

end
