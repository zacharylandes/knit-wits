
describe "admin can edit items " do
  context "when a user is an admin" do
        before(:each) do
        @category = create(:category)
        @admin = create(:user, role:1)
        @item = create(:item)
        end
    it "allows admin to edit an item" do

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_items_path

      click_on "Edit"

      expect(current_path).to eq(edit_admin_item_path(@item))


      attach_file('item[image]', File.absolute_path('app/assets/images/image.jpeg'))
      fill_in "item[title]", :with => "pantalones"
      fill_in "item[description]", :with => "the warmest"
      fill_in "item[price]", :with => 2.00
      select "active", :from => "item[status]"
      select "sweater3", :from => "item[category_id]"
      click_on ("Update Item")
      #
      expect(current_path).to eq(admin_items_path)
      expect(page).to have_content("pantalones")

      # expect(Item.count).to eq(1)

    end

    it "allows admin to update status" do

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_items_path
      select "retired", :from => "item[status]"

      click_on "Update Item"

      # 
      # attach_file('item[image]', File.absolute_path('app/assets/images/image.jpeg'))
      # fill_in "item[title]", :with => "pantalones"
      # fill_in "item[description]", :with => "the warmest"
      # fill_in "item[price]", :with => 2.00
      # select "active", :from => "item[status]"
      # select "sweater3", :from => "item[category_id]"
      # click_on ("Update Item")
      # #
      expect(current_path).to eq(admin_items_path)
      expect(page).to have_content("pantalones")

      # expect(Item.count).to eq(1)

    end

  end
end
