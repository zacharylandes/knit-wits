describe "Admin sees orders by state on analytics page for order_items" do
  before(:each) do
    @admin = create(:admin)
    user = create(:user, state: "KS")
    order1 = create(:order, user_id: user.id, status: "Completed")
    order2 = create(:order, user_id: user.id, status: "Completed")
    order3 = create(:order, user_id: user.id, status: "Completed")
    user1 = create(:user, state: "CO")
    order4 = create(:order, user_id: user1.id, status: "Completed")
  end

  scenario "will see orders by state Alphabetically" do
    login_as(@admin)

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

  scenario "will see order sorted by order count ascending per state" do
    login_as(@admin)

    visit admin_analytics_dashboard_path

    select("Count, High to Low")
    click_on "Sort"

    expect(page).to have_content("Admin Analytics Dashboard")
    expect(page).to have_content("Orders by State:")
    within ".state0" do
      expect(page).to have_content("KS")
    end
    within ".state1" do
      expect(page).to have_content("CO")
    end
  end

  scenario "will see order sorted by order count descending per state" do
    login_as(@admin)

    visit admin_analytics_dashboard_path

    select("Count, Low to High")
    click_on "Sort"

    expect(page).to have_content("Admin Analytics Dashboard")
    expect(page).to have_content("Orders by State:")
    within ".state0" do
      expect(page).to have_content("CO")
    end
    within ".state1" do
      expect(page).to have_content("KS")
    end
  end

  scenario "will see order sorted by state reverse Alphabetically" do
    login_as(@admin)

    visit admin_analytics_dashboard_path

    select("State, Z-A")
    click_on "Sort"

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
