describe 'homepage' do
  describe '#navigation' do
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
    it 'clicks on the home button' do
      visit '/categories'

      click_link 'Home'

      expect(current_path).to eq(items_path)
    end
    it 'clicks on the cart ' do
      visit '/'

      click_link ("0")

      expect(current_path).to eq(carts_path)
    end

    describe '#footer'do
      it 'clicks the facebook link' do
        visit '/'

        expect(page).to have_css('.fa-facebook')
        expect(page).to have_css('.fa-twitter')
        expect(page).to have_css('.fa-github')
      end
    end
  end
end
