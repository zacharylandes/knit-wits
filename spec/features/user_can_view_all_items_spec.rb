describe "user can view all items" do
  it "shows all items to user" do
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)

    visit items_path

    expect(page).to have_link(item1.title)
    expect(page).to have_link(item1.image)
    expect(page).to have_content(item1.price_in_dollars)
    expect(page).to have_link(item2.image)
    expect(page).to have_link(item2.title)
    expect(page).to have_content(item2.price_in_dollars)
    expect(page).to have_link(item3.title)
    expect(page).to have_link(item3.price)
    expect(page).to have_content(item3.price_in_dollars)
  end

  context "page has more than 15 items" do
    it "shows pagination buttons" do
      17.times do
        create(:item)
      end

      visit items_path

      within(".paginate-container") do
        expect(page).to have_content("Previous")
        expect(page).to have_content("Next")
      end
    end
  end

  context "page has less than 15 items" do
    it "does not show pagination buttons" do
      7.times do
        create(:item)
      end

      visit items_path

      within(".paginate-container") do
        expect(page).to_not have_content("Previous")
        expect(page).to_not have_content("Next")
      end
    end
  end
end
