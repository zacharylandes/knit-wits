describe Category do
  describe "instance methods" do
    describe "#highest_priced_item" do
      it "will show highest priced item" do
        item = create(:item)
        category = create(:category, items: [item])

        expect(category.highest_priced_item.title).to eq(item.title)
      end
    end

    describe "#total_orders" do
      it "will show the total orders for that category" do
        item = create(:item)
        order_items = create(:order_item, item: item)
        category = create(:category, items: [item])

        expect(category.total_orders).to eq(1)
      end
    end
  end

  describe "relationships", type: :model do
    it { should have_many(:items) }
  end

  describe "validations" do
    it "is invalid without name" do
      category = Category.new

      expect(category).to be_invalid
    end

    it "is valid with unique name" do
      category = Category.new(name: "Category")

      expect(category).to be_valid
    end

    it "is invalid with duplicate name" do
      Category.create(name: "Category")
      category = Category.new(name: "Category")

      expect(category).to be_invalid
    end
  end
end
