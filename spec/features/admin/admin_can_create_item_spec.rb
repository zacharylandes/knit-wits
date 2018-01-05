
describe "admin can create items " do
  context "when a user is an admin" do
    it "allows admin to see add an image" do
      category = create(:category)
      admin = create(:user, role:1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path
      attach_file('item[image]', File.absolute_path('app/assets/images/image.jpeg'))
      fill_in "item[title]", :with => "pantalones"
      fill_in "item[description]", :with => "the warmest"
      fill_in "item[price]", :with => 2.00
      select "active", :from => "item[status]"
      select "sweater1", :from => "item[category_id]"
      click_on ("Create Item")

      expect(current_path).to eq(admin_dashboard_path)
      within(:css, '.item')do
        page.find('img')['src'].should have_content 'image.jpeg'
      end
    end
  end
end
