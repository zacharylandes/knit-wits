describe "user can view all items" do
  it "shows all items to user" do
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)

    visit items_path

    expect(page).to have_link(item1.title)
    expect(page).to have_content(item1.price_in_dollars)
    expect(page).to have_link(item2.title)
    expect(page).to have_content(item2.price_in_dollars)
    expect(page).to have_link(item3.title)
    expect(page).to have_content(item3.price_in_dollars)
  end

  context "page has more than 15 items" do
    it "shows pagination buttons" do
      create_list(:item, 17)

      visit items_path

      within(".paginate-container") do
        expect(page).to have_content("Previous")
        expect(page).to have_content("Next")
      end
    end
  end

  context "page has less than 15 items" do
    it "does not show pagination buttons" do
      create_list(:item, 7)

      visit items_path

      within(".paginate-container") do
        expect(page).to_not have_content("Previous")
        expect(page).to_not have_content("Next")
      end
    end
  end

  describe "User can use sort dropdown" do
    before(:each) do
      create(:item, title: "A", price: 123)
      create(:item, title: "M", price: 53)
      create(:item, title: "X", price: 100)
    end

    it "is sorted by item title Alphabetically" do
      visit items_path

      select("Title, A-Z")
      click_on "Sort"

      within "#0" do
        expect(page).to have_content("A")
      end

      within "#1" do
        expect(page).to have_content("M")
      end

      within "#2" do
        expect(page).to have_content("X")
      end
    end

    it "is sorted by item title reverse Alphabetically" do
      visit items_path

      select("Title, Z-A")
      click_on "Sort"

      within "#0" do
        expect(page).to have_content("X")
      end

      within "#1" do
        expect(page).to have_content("M")
      end

      within "#2" do
        expect(page).to have_content("A")
      end
    end

    it "is sorted by item price high to low" do
      visit items_path

      select("Price, High to Low")
      click_on "Sort"

      within "#0" do
        expect(page).to have_content("A")
      end

      within "#1" do
        expect(page).to have_content("X")
      end

      within "#2" do
        expect(page).to have_content("M")
      end
    end

    it "is sorted by item price low to high" do
      visit items_path

      select("Price, Low to High")
      click_on "Sort"

      within "#0" do
        expect(page).to have_content("M")
      end

      within "#1" do
        expect(page).to have_content("X")
      end

      within "#2" do
        expect(page).to have_content("A")
      end
    end
  end
end
