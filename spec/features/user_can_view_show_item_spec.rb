describe "User visits item show page" do
  it "can see item details" do
    item = create(:item)

    visit item_path(item)

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price_in_dollars)
  end
end
