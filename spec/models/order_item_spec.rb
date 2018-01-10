describe OrderItem do
  describe "relationships", type: :model do
    it {should belong_to :item}
    it {should belong_to :order}
  end

  describe "instance methods" do
    before (:each) do
      item = create(:item, price: 1)
      @order_item = create(:order_item, item: item, quantity: 4)
    end

    describe "#line_item_subtotal" do
      it "returns line item subtotal" do
        result = @order_item.line_item_subtotal

        expect(result).to eq(4)
      end
    end

    describe "#subtotal_in_dollars" do
      it "returns line itme subtotal in dollars" do
        result = @order_item.subtotal_in_dollars

        expect(result).to eq("$0.04")
      end
    end
  end
end
