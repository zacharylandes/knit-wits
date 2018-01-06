describe Order do
  describe "validations" do
    before(:each) do
      @user = create(:user)
    end

    it "is valid" do
      order = Order.new(status: 0,
                        street: "123 Main St",
                        city: "Denver",
                        state: 1,
                        zipcode: 80525,
                        user: @user)

      expect(order).to be_valid
    end

    it "is invalid without status" do
      order = Order.new(street: "123 Main St",
                        city: "Denver",
                        state: 1,
                        zipcode: 80525,
                        user: @user)

      expect(order).to be_invalid
    end

    it "is invalid without street address" do
      order = Order.new(status: 0,
                        city: "Denver",
                        state: 1,
                        zipcode: 80525,
                        user: @user)

      expect(order).to be_invalid
    end

    it "is invalid without city" do
      order = Order.new(status: 0,
                        street: "123 Main St",
                        state: 1,
                        zipcode: 80525,
                        user: @user)

      expect(order).to be_invalid
    end

    it "is invalid without state" do
      order = Order.new(status: 0,
                        street: "123 Main St",
                        city: "Denver",
                        zipcode: 80525,
                        user: @user)

      expect(order).to be_invalid
    end

    it "is invalid without zipcode" do
      order = Order.new(status: 0,
                        street: "123 Main St",
                        city: "Denver",
                        state: 1,
                        user: @user)

      expect(order).to be_invalid
    end

    it "is invalid without a user" do
      order = Order.new(status: 0,
                        street: "123 Main St",
                        city: "Denver",
                        state: 1,
                        zipcode: 80525)

      expect(order).to be_invalid
    end
  end

  describe "relationships" do
    it { should have_many(:items)}
    it { should belong_to(:user)}
  end
end
