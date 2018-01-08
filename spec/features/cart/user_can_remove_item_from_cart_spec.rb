describe 'visitor visits cart show page' do
  context 'items are in cart' do
    before(:each) do
      @user = create(:user)
      @item = create(:item)
      visit "/login"

      fill_in "username", with: "bob"
      fill_in "password", with: 'password'
      click_on "Log In"
    end

    it 'can remove item from cart' do
      visit items_path

      click_button "Add to Cart"

      click_link ("1")


      expect(current_path).to eq(cart_path)
      within(".cart-contents") do
        expect(page).to have_content("#{@item.title}")
      end

      click_button 'Remove'

      expect(page).to have_content("Successfully removed #{@item.title} from your cart.")

      expect(page).to have_link("#{@item.title}")

      expect(page).to have_content("Shopping Cart")
      expect(page).to have_content("Your cart is currently Empty")
    end
  end
end
