describe "user sees login button on root page" do

  it "should see the form to login" do
    admin = create(:admin)

    visit "/login"

    fill_in "username", with: "#{admin.username}"
    fill_in "password", with: "#{admin.password}"

    click_on "Log In"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Logout")
  end
end
