describe "user is logged id" do
  it "can edit profile" do
    user = User.create(username: "Max",
                       password: "12345",
                       street: "123 Main St",
                       city: "Denver",
                       state: 1,
                       zipcode: 80525,
                       full_name: "Max",
                       role: 0)

    visit "/login"

    fill_in "username", with: user.username
    fill_in "password", with: user.password

    click_on "Log In"

    click_on "Edit Profile"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "user[username]", with: "Sam"
    fill_in "user[password]", with: 'password'

    click_on "Update User"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as Sam")
    expect(page).to have_content("Logout")
  end
end
