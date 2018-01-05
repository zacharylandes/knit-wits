describe Item do
  describe "validations" do
    it "is invalid without status" do
      item = Item.new(title: "item",
                      description: "description",
                      price: 1000,
                      image: "item_default.jpg",
                      category: create(:category))

      expect(item).to be_invalid
    end

    it "is valid with all attributes" do
      item = Item.new(title: "item",
                      description: "description",
                      price: 1000,
                      image: "item_default.jpg",
                      category: create(:category),
                      status: 1)

      expect(item).to be_valid
    end

    it "is invalid without title" do
      item = Item.new(description: "description",
                      price: 1000,
                      image: "item_default.jpg",
                      category: create(:category),
                      status: 1)

      expect(item).to be_invalid
    end

    it "is invalid without description" do
      item = Item.new(title: "item",
                      price: 1000,
                      image: "item_default.jpg",
                      category: create(:category),
                      status: 1)

      expect(item).to be_invalid
    end

    it "is invalid without price" do
      item = Item.new(title: "item",
                      description: "description",
                      image: "item_default.jpg",
                      category: create(:category),
                      status: 1)

      expect(item).to be_invalid
    end

    it "is invalid with a category" do
      item = Item.new(title: "item",
                      description: "description",
                      price: 1000,
                      image: "item_default.jpg",
                      status: 1)

      expect(item).to be_invalid
    end
  end

  describe "relationships", type: :model do
    it { should belong_to(:category)}
  end

  describe "instance methods" do
    it "#price_in_dollars" do
      item = create(:item, price: 5000)

      expect(item.price_in_dollars). to eq("$50.00")
    end

    it "#active?" do
      active_item = create(:item, price: 5000, status: 1)
      inactive_item = create(:item, price: 5000, status: 0)

      expect(active_item.active?).to be_truthy
      expect(inactive_item.active?).to be_falsy
    end

    it "#retired?" do
      retired_item = create(:item, price: 5000, status: 0)

      expect(retired_item.retired?).to be_truthy
    end

    it "#out_of_stock?" do
      out_of_stock_item = create(:item, price: 5000, status: 2)

      expect(out_of_stock_item.out_of_stock?).to be_truthy
    end
  end
end
