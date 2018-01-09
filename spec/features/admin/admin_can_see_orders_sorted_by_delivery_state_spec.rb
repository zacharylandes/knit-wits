describe "Admin sees orders by state on analytics page for order_items" do
  scenario "will see orders by state Alphabetically" do
    admin = create(:admin)
    user = create(:user, state: "KS")
    order1 = create(:order, user_id: user.id, status: "Completed")
    order2 = create(:order, user_id: user.id, status: "Completed")
    order3 = create(:order, user_id: user.id, status: "Completed")
    user1 = create(:user, state: "CO")
    order4 = create(:order, user_id: user1.id, status: "Completed")

    login_as(admin)

    visit admin_analytics_dashboard_path

    expect(page).to have_content("Admin Analytics Dashboard")
    expect(page).to have_content("Orders by State:")
    within ".state0" do
      expect(page).to have_content("CO")
    end
    within ".state1" do
      expect(page).to have_content("KS")
    end
  end

  scenario "will see order sorted by order count per state" do
    admin = create(:admin)
    user = create(:user, state: "KS")
    order1 = create(:order, user_id: user.id, status: "Completed")
    order2 = create(:order, user_id: user.id, status: "Completed")
    order3 = create(:order, user_id: user.id, status: "Completed")
    user1 = create(:user, state: "CO")
    order4 = create(:order, user_id: user1.id, status: "Completed")

    login_as(admin)

    visit admin_analytics_dashboard_path

    click_link "Sort by Order Count"

    save_and_open_page
    expect(page).to have_content("Admin Analytics Dashboard")
    expect(page).to have_content("Orders by State:")
    within ".state0" do
      expect(page).to have_content("KS")
    end
    within ".state1" do
      expect(page).to have_content("CO")
    end
  end


end
