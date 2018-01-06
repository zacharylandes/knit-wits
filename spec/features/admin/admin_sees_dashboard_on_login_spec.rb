describe "Admin sees login button on root page" do
  it "should see the form to login" do
    user = User.create!(username: "Max", password: '12345', role:1)

    visit "/login"

    fill_in "username", with: "Max"
    fill_in "password", with: '12345'

    click_on "Log In"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Logout")
  end
end
