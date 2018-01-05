describe "Visitor navigates to welcome page" do
  it "sees a welcome message and three items" do
    item_1 = create(:item)
    item_2 = create(:item)
    item_3 = create(:item)

    visit root_path

    expect(page).to have_content("Welcome, to our Witty Shop of Knits!")
    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_2.title)
    expect(page).to have_content(item_3.title)
  end
end
