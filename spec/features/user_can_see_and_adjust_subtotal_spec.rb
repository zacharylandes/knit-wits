describe 'user can view cart total' do
  context 'items are in cart' do
    before(:each) do
      @item = create(:item)
    end

    it 'user adds item, total changes' do
      visit items_path
      click_button "Add to Cart"
      click_button "Add to Cart"
      total = @item.price * 2

      click_link "Cart"

      expect(current_path).to eq(carts_path)
      expect(page).to have_content("2")
      expect(page).to have_content("#{total}")
    end

    it 'user can decrease item, total changes' do
      visit items_path
      click_button "Add to Cart"
      click_button "Add to Cart"
      total = @item.price * 2

      click_link "Cart"
      # click here to adjust the item quantity in cart

      expect(current_path).to eq(carts_path)
      expect(page).to have_content("1")
      expect(page).to have_content("Knit Total Cost: $100.00")
    end
  end
end
