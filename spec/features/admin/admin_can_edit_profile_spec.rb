describe "user is logged id" do
  it "can edit profile" do
    user = create(:user)

    visit "/login"

    fill_in "username", with: user.username
    fill_in "password", with: user.password

    click_on "Log In"

    click_on "Edit Profile"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "user[username]", with: "Sam"
    fill_in "user[password]", with: 'password'

    click_on "Update my Account"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as Sam")
    expect(page).to have_content("Logout")
  end
end
