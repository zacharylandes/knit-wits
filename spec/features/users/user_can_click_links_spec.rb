describe 'homepage' do
  describe '#navigation' do
      # before(:each) do
      #   @item = create
      #   @user = create(:user)
      #   visit "/login"
      #
      #   fill_in "username", with: "bob"
      #   fill_in "password", with: 'password'
      #   click_on "Log In"
      # end
    it "has log in button if not logged in" do
      visit '/'

      expect(page).to have_link("Login")
    end

    it "has log out button if logged in" do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit '/'

      expect(page).to have_link("Logout")
    end

    it 'clicks on the knits button' do
      visit '/'
      click_link 'Knits'

      expect(current_path).to eq(items_path)
    end
    it 'clicks on the categories button' do
      visit '/'

      click_link 'Categories'

      expect(current_path).to eq(categories_path)
    end
    it 'clicks on the logo button' do
      visit '/categories'

      first('a').click
      expect(current_path).to eq("/")
    end

    it 'clicks on the cart ' do
      visit '/'

      click_link ("0")

      expect(current_path).to eq(cart_path)
    end

    describe '#footer'do
      context "max's profile" do
        it "has social profile links" do
          visit '/'

          within ".max" do
            expect(page).to have_link('max-github')
          end
        end
      end

      context "zach's profile" do
        it "has social profile links" do
          visit '/'

          within ".zach" do
            expect(page).to have_link('zach-github')
          end
        end
      end

      context "katy's profile" do
        it "has social profile links" do
          visit '/'

          within ".katy" do
            expect(page).to have_link('katy-github')
          end
        end
      end

    end
  end
end
