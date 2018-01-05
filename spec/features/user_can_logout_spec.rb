describe "Signed in user can logout" do
  it "by clicking logout button in navigation bar" do
    @user = create(:user)
    visit '/login'

    fill_in :username, with: @user.username
    fill_in :password, with: @user.password
    click_on "Log Me In"

    visit '/'

    click_link "Logout"

    expect(page).to have_content("Login")
  end
end
