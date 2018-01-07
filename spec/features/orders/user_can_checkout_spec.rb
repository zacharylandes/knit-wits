describe "User can checkout" do
  describe "user is viewing cart" do
    before(:each) do
      @item = create(:item)
      @user = create(:user)
      visit "/login"

      fill_in "username", with: "user 1"
      fill_in "password", with: 'password'

      click_on "Log In"
      visit item_path(@item)

      click_button "Add to Cart"

    end


    it "can checkout " do

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit cart_path(@user)

      fill_in "item[quantity]", with: 4

      click_on "Update"

      expect(page).to have_content(4)
      click_link ('Checkout')
      expect(current_path).to eq(orders_path)
      expect(page).to have_content("order was successfully placed")
    end
  end
end
