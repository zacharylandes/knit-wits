describe "As a validated user" do
  describe "when i visit /orders then I should see my past orders" do
    describe "and i can click a link to view a specific order" do
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

      it "has the order item info" do
        visit orders_path

        click_link "#{@order_1.id}"

        expect(current_path).to eq("/orders/#{@order_1.id}")
        expect(page).to have_content("Order Total: #{@order_1.total_in_dollars}")
        expect(page).to have_content("#{@item_1.title}")
        expect(page).to have_content("#{@item_2.title}")
        expect(page).to have_content("#{@order_1.order_items.first.subtotal_in_dollars}")
        expect(page).to have_content("#{@order_1.order_items.last.subtotal_in_dollars}")
      end

      it "has the user address" do
        visit orders_path

        click_link "#{@order_1.id}"

        expect(page).to have_content("#{@user.full_name}")
        expect(page).to have_content("#{@user.street}")
        expect(page).to have_content("#{@user.city}")
        expect(page).to have_content("#{@user.state}")
        expect(page).to have_content("#{@user.zipcode}")
      end
    end
  end
end
