describe 'unregistered can register for account' do
  it 'can create new account' do

    visit '/login'

    expect(page).to have_link("Create Account")

    click_on "Create Account"

    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "katyjane8"
    fill_in "user[password]", with: "reallygoodpw"
    fill_in "user[full_name]", with: "Katy"
    fill_in "user[street]", with: '123 main'
    fill_in "user[city]", with: "denv"
    select "CO", from: "user[state]"
    fill_in "user[zipcode]", with: 12345

    click_on "Register"

    user = User.last

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{user.username}")
    expect(user.username).to eq("katyjane8")
    expect(user.full_name).to eq("Katy")
    expect(user.street).to eq("123 main")
    expect(user.city).to eq("denv")
    expect(user.state).to eq("CO")
    expect(user.zipcode).to eq(12345)
  end
end
