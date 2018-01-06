describe "user is logged id" do
  it "can edit profile" do

    user = create(:user)

    visit "/login"

    fill_in "username", with: "#{user.username}"
    fill_in "password", with: "#{user.password}"

    click_on "Log In"

    click_on "Edit Profile"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "user[username]", with: "Sam"
    fill_in "user[password]", with: "reallygoodpw"
    fill_in "user[full_name]", with: "Katy"
    fill_in "user[street]", with: '123 main'
    fill_in "user[city]", with: "denv"
    select "CO", from: "user[state]"
    fill_in "user[zipcode]", with: 12345

    click_on "Update User"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as Sam")
    expect(page).to have_content("Logout")
  end
end
