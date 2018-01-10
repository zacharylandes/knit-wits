describe "As an admin when I visit admin items" do
  before :each do
    @admin = create(:admin)
    @item_a = create(:item, title: "A", status: "active", price: 100)
    @item_m = create(:item, title: "M", status: "active", price: 123)
    @item_x = create(:item, title: "X", status: "retired", price: 76)
  end

  it "can sort items by title alphabetically" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit admin_items_path
    select("Title, A-Z")
    click_on "Apply"

    within('#0') do
      expect(page).to have_content("A")
    end
    within "#1" do
      expect(page).to have_content("M")
    end
    within "#2" do
      expect(page).to have_content("X")
    end
  end

  it "can sort items by title reverse alphabetically" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit admin_items_path
    select("Title, Z-A")
    click_on "Apply"

    within('#0') do
      expect(page).to have_content("X")
    end
    within "#1" do
      expect(page).to have_content("M")
    end
    within "#2" do
      expect(page).to have_content("A")
    end
  end

  it "can sort items by price low to high" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit admin_items_path
    select("Price, Low to High")
    click_on "Apply"

    within('#0') do
      expect(page).to have_content("X")
    end
    within "#1" do
      expect(page).to have_content("A")
    end
    within "#2" do
      expect(page).to have_content("M")
    end
  end

  it "can sort items by price high to low" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit admin_items_path
    select("Price, High to Low")
    click_on "Apply"

    within('#0') do
      expect(page).to have_content("M")
    end
    within "#1" do
      expect(page).to have_content("A")
    end
    within "#2" do
      expect(page).to have_content("X")
    end
  end

  it "can filter items by active status" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit admin_items_path
    select("Active")
    click_on "Apply"

    within('#0') do
      expect(page).to have_content("A")
    end
    within "#1" do
      expect(page).to have_content("M")
    end
  end

  it "can filter items by retired status" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit admin_items_path
    select("Retired")
    click_on "Apply"

    within('#0') do
      expect(page).to have_content("X")
    end
  end

  it "can sort and filter" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit admin_items_path
    select("Title, A-Z")
    select("Active")
    click_on "Apply"


    within('#0') do
      expect(page).to have_content("A")
    end
    within "#1" do
      expect(page).to have_content("M")
    end

    expect(page).to_not have_selector('#2')
  end
end
