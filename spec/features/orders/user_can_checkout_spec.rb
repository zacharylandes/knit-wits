describe "User can checkout" do
  describe "user is viewing cart" do
    before(:each) do
      @item = create(:item)
      @user = create(:user)
      visit "/login"

      fill_in "username", with: "bob"
      fill_in "password", with: 'password'

      click_on "Log In"
      visit item_path(@item)

      click_button "Add to Cart"

      visit cart_path(@user)
    end


    it "can checkout " do

      fill_in "item[quantity]", with: 4

      click_on "Update"

      click_link ('Checkout')

      expect(page).to have_content(4)
      expect(current_path).to eq(orders_path)
      expect(page).to have_content("order was successfully placed")
    end
  end
end
