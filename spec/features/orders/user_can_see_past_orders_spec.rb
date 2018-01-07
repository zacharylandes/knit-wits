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
        expect(page).to have_content("Knit Total Cost: #{@order_1.total_in_dollars}")
        expect(page).to have_content("#{@order_1.status}")
        expect(page).to have_content("#{@item_1.title}")
        expect(page).to have_content("#{@item_2.title}")
        expect(page).to have_content("#{@order_1.order_items.first.subtotal_in_dollars}")
        expect(page).to have_content("#{@order_1.order_items.last.subtotal_in_dollars}")
        expect(page).to have_content("Order Submitted: #{@order_1.created_at.strftime("%b %d, %Y")}")
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

      context "order status: Ordered" do
        it "does not have cancelled or completed message" do
          visit order_path(@order_1)

          expect(page).to_not have_content("Completed On:")
          expect(page).to_not have_content("Cancelled On:")
        end
      end

      context "order status: Paid" do
        it "does not have cancelled or completed message" do
          @order_1.update_column(:status, 1)
          visit order_path(@order_1)

          expect(page).to_not have_content("Completed On:")
          expect(page).to_not have_content("Cancelled On:")
        end
      end

      context "order status: Cancelled" do
        it "has cancelled on message" do
          @order_1.update_column(:status, 3)
          visit order_path(@order_1)

          expect(page).to_not have_content("Completed On: #{@order_1.updated_at.strftime("%b %d, %Y")}")
          expect(page).to have_content("Cancelled On: #{@order_1.updated_at.strftime("%b %d, %Y")}")
        end
      end

      context "order status: Completed" do
        it "has completed on message" do
          @order_1.update_column(:status, 2)
          visit order_path(@order_1)

          expect(page).to have_content("Completed On: #{@order_1.updated_at.strftime("%b %d, %Y")}")
          expect(page).to_not have_content("Cancelled On: #{@order_1.updated_at.strftime("%b %d, %Y")}")
        end
      end
    end
  end
end
