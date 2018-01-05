describe "user sees login button on root page" do
  it "can see button" do
    visit "/"

    expect(page).to have_content("Login")
  end

  it "can click the button and go to login page" do
    visit "/"

    click_link "Login"
    expect(current_path).to eq("/login")
  end

  it "should see the form to login" do
    user = create(:user)

    visit "/login"

    fill_in "username", with: user.username
    fill_in "password", with: user.password

    click_on "Log In"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Logged in as #{user.username}")
    # expect(page).to have_content("Logout")
  end
end
