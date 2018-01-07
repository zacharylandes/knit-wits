describe "User can view all orders" do
  describe "user is viewing cart" do
    before(:each) do
      @user = create(:user)
      @user.orders << create(:order, user: @user)
      @user.orders << create(:order, user: @user)
      @order_1 = @user.orders.first
      @item_1 = create(:item)
      @item_2 = create(:item)
      @order_1.order_items << OrderItem.create(item: @item_1, quantity: 2)
      @order_1.order_items << OrderItem.create(item: @item_2, quantity: 4)
      visit login_path
      fill_in :username, with: @user.username
      fill_in :password, with: @user.password
      click_on "Log In"
    end

    it "can view all past orders " do
      visit orders_path

      within "##{@order_1.id}" do
        expect(page).to have_link("#{@order_1.id}")
        expect(page).to have_content("#{@order_1.status}")
        expect(page).to have_content("#{@order_1.created_at.strftime("%b %d, %Y")}")
      end
    end

  end
end
