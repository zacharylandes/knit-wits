describe "User can checkout" do
  describe "user is viewing cart " do
    before(:each) do
      @item = create(:item)
      @user = create(:user)
    end


    it "can checkout " do
      visit "/login"

      fill_in "username", with: "bob"
      fill_in "password", with: 'password'

      click_on "Log In"

      visit item_path(@item)

      click_button "Add to Cart"

      visit cart_path(@user)

      click_link ('Checkout')
      expect(page).to have_content("You now have 2 #{@item.title}s in your cart!")
    end
  end
end
