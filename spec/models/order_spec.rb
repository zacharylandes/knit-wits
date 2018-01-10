describe Order do
  describe "instance methods" do
    before(:each) do
      item = create(:item, price: 10)
      order_item = create(:order_item, item: item, quantity: 3)
      @order = order_item.order
    end

    describe '#order_total' do
      it "returns the order total" do
        result = @order.order_total

        expect(result).to eq(30)
      end
    end

    describe '#total_in_dollars' do
      it "returns the order total formatted in dollars" do
        result = @order.total_in_dollars

        expect(result).to eq("$0.30")
      end
    end
  end

  describe "relationships" do
    it { should have_many(:items).through(:order_items)}
    it { should belong_to(:user)}
  end

  describe "class methods" do
    describe "::completed_by_state(sort)" do
      before(:each) do
        user_1 = create(:user, state: 0)
        user_2 = create(:user, state: 4)
        create_list(:order, 3, user: user_1, status: "Completed")
        create_list(:order, 2, user: user_2, status: "Completed")
      end

      context "sort = 'users.state ASC'" do
        it "returns orders sorted by state alphabetically" do
          result = Order.completed_by_state("users.state ASC")

          expect(result).to eq({0=>3, 4=>2})
        end
      end

      context "sort = 'users.state DESC'" do
        it "returns orders sorted by state reverse alphabetically" do
          result = Order.completed_by_state("users.state DESC")

          expect(result).to eq({4=>2, 0=>3})
        end
      end

      context "sort = 'Count, Low to High'" do
        it "returns orders by state sorted by order count low to high" do
          result = Order.completed_by_state("count_all ASC")

          expect(result).to eq({4=>2, 0=>3})
        end
      end

      context "sort = 'Count, High to Low'" do
        it "returns orders by state sorted by order count high to low" do
          result = Order.completed_by_state("count_all DESC")

          expect(result).to eq({0=>3, 4=>2})
        end
      end
    end
  end

  describe "validations" do
    before(:each) do
      @user = create(:user)
    end

    it "is valid" do
      order = Order.new(status: 0,
                        user: @user)

      expect(order).to be_valid
    end


    it "is invalid without a user" do
      order = Order.new(status: 0)

      expect(order).to be_invalid
    end

    it "is invalid without a status" do
      order = Order.new(user: @user)

      expect(order).to be_invalid
    end
  end
end
