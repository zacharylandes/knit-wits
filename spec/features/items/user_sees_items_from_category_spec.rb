describe "User visits category index" do
  before(:each) do
    @category1 = create(:category, name: "sweater")
    @item1 = create(:item, categories: [@category1])
    @item2 = create(:item, categories: [@category1])
    @category2 = create(:category, name: "mitten")
    @item3 = create(:item, categories: [@category2])
    @item4 = create(:item, categories: [@category2])
  end

  describe "user can view all items in certain category" do
    it "shows all items in category to user" do
      visit category_path(@category1.slug)

      expect(current_path).to eq("/#{@category1.slug}")

      expect(page).to have_content(@category1.name.capitalize)
      expect(page).to have_content(@item1.title)
      expect(page).to have_content(@item1.price_in_dollars)
    end
  end

  describe "user can click on category link to go to that category show page" do
    it "is redirected to that category page" do
      visit categories_path

      click_link @category2.name.capitalize

      expect(current_path).to eq("/#{@category2.slug}")

      expect(page).to have_content(@category2.name.capitalize)
      expect(page).to have_content(@item3.title)
    end
  end
end
