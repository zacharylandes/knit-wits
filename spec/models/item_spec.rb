describe Item do
  describe "validations" do
    it "is valid with all attributes" do
      item = Item.new(title: "item",
                      description: "description",
                      price: 1000,
                      image: "item_default.jpg",
                      category: create(:category))

      expect(item).to be_valid
    end

    it "is invalid without title" do
      item = Item.new(description: "description",
                      price: 1000,
                      image: "item_default.jpg",
                      category: create(:category))

      expect(item).to be_invalid
    end

    it "is invalid without description" do
      item = Item.new(title: "item",
                      price: 1000,
                      image: "item_default.jpg",
                      category: create(:category))

      expect(item).to be_invalid
    end

    it "is invalid without price" do
      item = Item.new(title: "item",
                      description: "description",
                      image: "item_default.jpg",
                      category: create(:category))

      expect(item).to be_invalid
    end

    it "is invalid without an image" do
      item = Item.new(title: "item",
                      description: "description",
                      price: 1000,
                      category: create(:category))

      expect(item).to be_invalid
    end

    it "is invalid with a category" do
      item = Item.new(title: "item",
                      description: "description",
                      price: 1000,
                      image: "item_default.jpg")

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
  end
end
