describe "user can view all items" do
  it "shows all items to user" do
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)

    visit items_path

    expect(page).to have_content(item1.title)
    expect(page).to have_content(item1.price)
  end
end
