describe "Admin sees orders by state on analytics page for order_items" do
  scenario "will see orders by state specs" do
    admin = create(:admin)
    user = create(:user)
    order1 = create(:order, user_id: user.id)
    order2 = create(:order, user_id: user.id)
    order3 = create(:order, user_id: user.id)
    user1 = create(:user)
    order4 = create(:order, user_id: user1.id)

    login_as(admin)

    visit admin_analytics_dashboard_path

    expect(page).to have_content("Admin Analytics Dashboard")
    expect(page).to have_content("Orders by State:")
    expect(page).to have_content(order.user.state)
    expect(page).to have_content("AK")
  end
end
