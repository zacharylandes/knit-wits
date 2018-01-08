describe "Admin sees user breakdown on analytics page for categories" do
  scenario "will see category with highest price item" do
    admin = create(:admin)
    category = create(:category)
    item = create(:item, categories: [category])
    user = create(:user)
    order1 = create(:order, user_id: user.id)
    order2 = create(:order, user_id: user.id)
    order3 = create(:order, user_id: user.id)
    user1 = create(:user)
    order4 = create(:order, user_id: user1.id)

    login_as(admin)

    visit admin_analytics_dashboard_path

    expect(page).to have_content("Admin Analytics Dashboard")
    expect(page).to have_content("Category with highest price item: #{category.name.capitalize}")
  end
end
