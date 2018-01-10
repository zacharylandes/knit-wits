
describe "admin can edit items " do
  context "when a user is an admin" do
      before(:each) do
        @category = create(:category)
        @admin = create(:user, role:1)
        @item = create(:item, categories: [@category])
      end

      it "allows admin to update status to retired" do

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

        visit admin_items_path

        within('#0') do
          click_button "Retire Item"
        end
        within "#0" do
          expect(page).to have_content("retired")
        end
      end

      it "allows admin to update status to active" do
        create(:item, status: 0)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

        visit admin_items_path

        within('#1') do
          click_button "Reactivate Item"
        end
        within '#1' do
          expect(page).to have_content("active")
        end
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
      select "#{@category.name}", :from => "item[categories][]"
      click_on ("Update Item")


      expect(current_path).to eq(admin_items_path)
      expect(page).to have_content("pantalones")
      expect(page).to have_content("the warmest")

    end

    it "retired item is created when item is retired" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_items_path

      click_on "Edit"

      expect(current_path).to eq(edit_admin_item_path(@item))

      attach_file('item[image]', File.absolute_path('app/assets/images/image.jpeg'))
      fill_in "item[title]", :with => "pantalones"
      fill_in "item[description]", :with => "the warmest"
      fill_in "item[price]", :with => 2.00
      select "retired", :from => "item[status]"
      select "#{@category.name}", :from => "item[categories][]"
      click_on ("Update Item")

      retired_item = RetiredItem.last

      expect(current_path).to eq(admin_items_path)
      expect(page).to have_content("pantalones")
      expect(page).to have_content("retired")
      expect(retired_item.item_id).to eq(@item.id)
    end
  end
end
