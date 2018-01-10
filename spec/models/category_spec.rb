describe Category do
  describe "instance methods" do
    describe '#generate_slug' do
      it "parameterizes category name" do
        category = Category.new(name: "Max Stuff")
        result = category.generate_slug

        expect(result).to eq("max-stuff")
      end
    end

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
        create_list(:order_item,3, item: item)
        category = create(:category, items: [item])

        expect(category.total_orders).to eq(3)
      end
    end
  end



  describe "relationships", type: :model do
    it { should have_many(:items).through(:item_categories) }
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
