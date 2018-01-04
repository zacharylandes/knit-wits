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
end
