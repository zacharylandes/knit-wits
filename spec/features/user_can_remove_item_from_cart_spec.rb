describe 'visitor visits cart show page' do
  context 'items are in cart' do
    before(:each) do
      @item = create(:item)
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

      expect(page).to have_content("You have deleted #{@item.title} from your cart!")

      expect(page).to have_link("#{@item.title}")

      within(".cart-contents") do
        expect(page).to_not have_content("#{@item.title}")
      end

    end
  end
end
