describe "User tries to view a specific order page" do
  before(:each) do
    @user_1 = create(:user)
    @user_1.orders << create(:order, user: @user_1)
    @user_1.orders << create(:order, user: @user_1)
    @order_1 = @user_1.orders.first
    @item_1 = create(:item)
    @item_2 = create(:item)
    @order_1.order_items << OrderItem.create(item: @item_1, quantity: 2)
    @order_1.order_items << OrderItem.create(item: @item_2, quantity: 4)
  end

  context "as the user that placed the order" do
    it "can view order" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

      visit order_path(@order_1)

      expect(current_path).to eq(order_path(@order_1))
    end
  end

  context "as another user" do
    it "cannot view order" do
      @user_2 = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_2)

      visit order_path(@order_1)

      expect(current_path).to eq("/")
      expect(page).to have_content("Order belongs to another user")
    end
  end

  context "as an admin" do
    it "can view order" do
      @admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit order_path(@order_1)

      expect(current_path).to eq(order_path(@order_1))
    end
  end
end
