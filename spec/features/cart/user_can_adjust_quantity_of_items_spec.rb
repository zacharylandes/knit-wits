describe "Visitor views their cart" do
    before(:each) do
      @user = create(:user)
      @item = create(:item)
      visit "/login"

      fill_in "username", with: "bob"
      fill_in "password", with: 'password'
      click_on "Log In"
    end

    it "visitor can see the quantity of items in cart" do
      visit items_path

      click_button "Add to Cart"

      expect(page).to have_selector("input")
    end

    it "visitor can change the quantity of items in a cart " do
      visit items_path

      click_button "Add to Cart"

      fill_in "item[quantity]", with: 4

      click_on "Update"

      expect(page).to have_content("You now have 4 cool mittens in your cart!")
    end

end
