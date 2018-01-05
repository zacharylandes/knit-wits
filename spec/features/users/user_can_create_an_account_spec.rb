describe 'unregistered can register for account' do
  it 'can create new account' do

    visit '/login'

    expect(page).to have_link("Create Account")

    click_on "Create Account"

    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "katyjane8"
    fill_in "user[password]", with: "reallygoodpw"

    click_on "Register"

    user = User.last

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{user.username}")
  end
end
