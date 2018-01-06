
describe "admin can create items " do
  context "when a user is an admin" do
        before(:each) do
        @category = create(:category)
        @admin = create(:user, role:1)
        end
    it "allows admin to add an image" do

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_items_path

      attach_file('item[image]', File.absolute_path('app/assets/images/image.jpeg'))
      fill_in "item[title]", :with => "pantalones"
      fill_in "item[description]", :with => "the warmest"
      fill_in "item[price]", :with => 2.00
      select "active", :from => "item[status]"
      select "sweater1", :from => "item[category_id]"
      click_on ("Create Item")

      expect(current_path).to eq(admin_items_path)
      expect(Item.count).to eq(1)

    end
      it "allows admin to see an image" do

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

        visit admin_items_path
        attach_file('item[image]', File.absolute_path('app/assets/images/image.jpeg'))
        fill_in "item[title]", :with => "pantalones"
        fill_in "item[description]", :with => "the warmest"
        fill_in "item[price]", :with => 2.00
        select "active", :from => "item[status]"
        select "sweater2", :from => "item[category_id]"
        click_on ("Create Item")

        expect(current_path).to eq(admin_items_path)

        expect(page).to have_content("pantalones")
        expect(page).to have_content("the warmest")
        expect(page).to have_content(2.00)

        within(:css, '.all-items')do
          page.find('img')['src'].should have_content 'image.jpeg'
        end
      end
  end
end
