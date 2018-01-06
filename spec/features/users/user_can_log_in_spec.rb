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
    user = User.create!(username: "Max", password: '12345')

    visit "/login"

    fill_in "username", with: "Max"
    fill_in "password", with: '12345'

    click_on "Log In"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{user.username}")
    expect(page).to have_content("Logout")
  end
end
