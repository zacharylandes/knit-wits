describe "User visits categories index page" do
  context "as admin" do
    it 'can see dashboard' do
      admin = create(:admin)

      visit "/login"

      fill_in "username", with: "#{admin.username}"
      fill_in "password", with: "#{admin.password}"

      click_on "Log In"

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Admin Dashboard")
      expect(page).to have_content("Logout")
    end
  end

  context "as default user" do
    it 'does not allow default user to see dashboard ' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit admin_dashboard_path
      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist.")
      end
  end
  context "as a visitor " do
    it 'does not allow visitor to see dashboard' do
      visit admin_dashboard_path
      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist.")
      end
  end

end
