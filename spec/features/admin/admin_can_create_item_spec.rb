
describe "admin can create items " do
  context "when a user is an admin" do
    before(:each) do
      @category = create(:category)
      @category_1 = create(:category)
      @admin = create(:user, role:1)
    end

    it "allows admin to add an image" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_items_path

      click_link "Create New Item"

      attach_file('item[image]', File.absolute_path('app/assets/images/image.jpeg'))
      fill_in "item[title]", :with => "pantalones"
      fill_in "item[description]", :with => "the warmest"
      fill_in "item[price]", :with => 2.00
      select "active", :from => "item[status]"
      select "#{@category.name}", :from => "item[categories][]"
      click_on ("Create Item")

      expect(current_path).to eq(admin_items_path)
      expect(Item.count).to eq(1)
    end

    it "price must be greater than zero" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_items_path

      click_link "Create New Item"

      attach_file('item[image]', File.absolute_path('app/assets/images/image.jpeg'))
      fill_in "item[title]", :with => "pantalones"
      fill_in "item[description]", :with => "the warmest"
      fill_in "item[price]", :with => -12.00
      select "active", :from => "item[status]"
      select "#{@category.name}", :from => "item[categories][]"
      click_on ("Create Item")

      expect(page).to have_content("Invalid Attributes, Make Sure Item Attributes are Valid")
    end

    it "can have multiple categories" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_items_path

      click_link "Create New Item"

      attach_file('item[image]', File.absolute_path('app/assets/images/image.jpeg'))
      fill_in "item[title]", :with => "pantalones"
      fill_in "item[description]", :with => "the warmest"
      fill_in "item[price]", :with => 2.00
      select "active", :from => "item[status]"
      select "#{@category.name}", :from => "item[categories][]"
      select "#{@category_1.name}", :from => "item[categories][]"
      click_on ("Create Item")
      @item = Item.last

      expect(@item.categories.count).to eq(2)
    end

    it "allows admin to see an image" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_items_path

      click_link "Create New Item"

      attach_file('item[image]', File.absolute_path('app/assets/images/image.jpeg'))
      fill_in "item[title]", :with => "pantalones"
      fill_in "item[description]", :with => "the warmest"
      fill_in "item[price]", :with => 2.00
      select "active", :from => "item[status]"
      select "#{@category.name}", :from => "item[categories][]"
      click_on ("Create Item")

      expect(current_path).to eq(admin_items_path)

      expect(page).to have_content("pantalones")
      expect(page).to have_content("the warmest")
      expect(page).to have_content("$0.02")

      within('#0')do
        page.find('img')['src'].should have_content
      end
    end

    it "allows image to be optional" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_items_path

      click_link "Create New Item"


      fill_in "item[title]", :with => "pantalones"
      fill_in "item[description]", :with => "the warmest"
      fill_in "item[price]", :with => 2.00
      select "active", :from => "item[status]"
      select "#{@category.name}", :from => "item[categories][]"
      click_on ("Create Item")

      expect(current_path).to eq(admin_items_path)

      expect(page).to have_content("pantalones")
      expect(page).to have_content("the warmest")
      expect(page).to have_content("$0.02")

      within('#0')do
        page.find('img')['src'].should have_content
      end
    end

    it "Cannot have items with same name" do
      create(:item, title: "pantalones")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_items_path

      click_link "Create New Item"


      fill_in "item[title]", :with => "pantalones"
      fill_in "item[description]", :with => "the warmest"
      fill_in "item[price]", :with => 2.00
      select "active", :from => "item[status]"
      select "#{@category.name}", :from => "item[categories][]"
      click_on ("Create Item")

      expect(page).to have_content("Invalid Attributes, Make Sure Item Attributes are Valid")

    end
  end
end
