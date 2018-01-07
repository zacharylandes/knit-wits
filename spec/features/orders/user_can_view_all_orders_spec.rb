describe "User can view all orders" do
  describe "user is viewing cart" do
    before(:each) do
      @item = create(:item)
      @user = create(:user)
      visit "/login"
      # byebug
      fill_in "username", with: "user 62"
      fill_in "password", with: 'password'

      click_on "Log In"
      visit item_path(@item)

      click_button "Add to Cart"
      visit cart_path(@user)
    end


    it "can view all past orders " do

      click_link ('Checkout')

      visit item_path(@item)

      click_button "Add to Cart"

      fill_in "item[quantity]", with: 3

      click_on "Update"

      click_link ('Checkout')
      expect(page).to have_content(3)
      expect(page).to have_content(1)

      expect(page).to have_content(15000)
      expect(page).to have_content(5000)

      expect(current_path).to eq(orders_path)
      expect(page).to have_content("order was successfully placed")

    end

    it "can view all past orders " do

      click_link ('Checkout')

      visit item_path(@item)

      expect(page).to have_content(0)
    end

  end
end
