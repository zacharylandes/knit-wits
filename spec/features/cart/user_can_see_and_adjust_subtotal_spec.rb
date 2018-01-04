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

      click_link ("2")


      expect(current_path).to eq(carts_path)
      expect(page).to have_content("#{total}")
    end

    it 'user can decrease item, total changes' do
      visit items_path
      click_button "Add to Cart"
      click_button "Add to Cart"
      total = @item.price * 2

      click_link ("2")

      fill_in "quantity", with: 4
      click_on "Save changes"

      expect(page).to have_content(4)
      expect(current_path).to eq(carts_path)
      expect(page).to have_content("Knit Total Cost: $200.00")
    end
  end
end
