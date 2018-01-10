describe User do
  describe "class methods" do
    describe "::user_most_orders" do
      it "returns user with most orders" do
        min = create(:user, username: "Min")
        max = create(:user, username: "Max")
        create(:order, user: min)
        create_list(:order, 3, user: max)

        result = User.user_most_orders

        expect(result).to eq("Max")
      end
    end
  end

  describe "relationships", type: :model do
    it {should have_many(:orders) }
  end

  describe "validations" do
    it "is invalid without username" do
      user = User.new(password: "12345",
                      role: "default",
                      full_name: "Max",
                      street: "main",
                      city: "Denver",
                      state: 1,
                      zipcode: 12356)

      expect(user).to be_invalid
    end

    it "is invalid with duplicate username" do
      User.create(username: "Maxscores",
                  password: "12345",
                  role: "default",
                  full_name: "Max",
                  street: "main",
                  city: "Denver",
                  state: 1,
                  zipcode: 12356)

      user = User.new(username: "Maxscores",
                      password: "12345",
                      role: "default",
                      full_name: "Max",
                      street: "main",
                      city: "Denver",
                      state: 1,
                      zipcode: 12356)

      expect(user).to be_invalid
    end

    it "is invalid without password" do
      user = User.new(username: "Maxscores",
                      role: "default",
                      full_name: "Max",
                      street: "main",
                      city: "Denver",
                      state: 1,
                      zipcode: 12356)

      expect(user).to be_invalid
    end

    it "is invalid without full_name" do
      user = User.new(username: "Maxscores",
                      password: "12345",
                      role: "default",
                      street: "main",
                      city: "Denver",
                      state: 1,
                      zipcode: 12356)

      expect(user).to be_invalid
    end

    it "is invalid without street" do
      user = User.new(username: "Maxscores",
                      password: "12345",
                      role: "default",
                      full_name: "Max",
                      city: "Denver",
                      state: 1,
                      zipcode: 12356)

      expect(user).to be_invalid
    end

    it "is invalid without city" do
      user = User.new(username: "Maxscores",
                      password: "12345",
                      role: "default",
                      full_name: "Max",
                      street: "main",
                      state: 1,
                      zipcode: 12356)

      expect(user).to be_invalid
    end

    it "is invalid without state" do
      user = User.new(username: "Maxscores",
                      password: "12345",
                      role: "default",
                      full_name: "Max",
                      street: "main",
                      city: "Denver",
                      zipcode: 12356)

      expect(user).to be_invalid
    end

    it "is invalid without zipcode" do
      user = User.new(username: "Maxscores",
                      password: "12345",
                      role: "default",
                      full_name: "Max",
                      street: "main",
                      city: "Denver",
                      state: 1)

      expect(user).to be_invalid
    end

    it "is valid with all attributes" do
      user = User.new(username: "Maxscores",
                      password: "12345",
                      role: "default",
                      full_name: "Max",
                      street: "main",
                      city: "Denver",
                      state: 1,
                      zipcode: 12356)

      expect(user).to be_valid
    end
  end
end
