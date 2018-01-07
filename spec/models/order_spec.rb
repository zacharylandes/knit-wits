describe Order do
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

  describe "relationships" do
    it { should have_many(:items)}
    it { should belong_to(:user)}
  end
end
