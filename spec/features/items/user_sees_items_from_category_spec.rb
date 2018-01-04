describe "user can view all items in certain category" do
  it "shows all items in category to user" do
    category1 = create(:category)
    item1 = create(:item, category_id: 1) #sweater
    item2 = create(:item, category_id: 1) #sweater
    category2 = create(:category)
    item3 = create(:item, category_id: 2) #mittens
    item4 = create(:item, category_id: 2) #mittens

    visit category_path(category1)

    expect(page).to have_content(item1.title)
    expect(page).to have_content(item1.price_in_dollars)
  end
end
