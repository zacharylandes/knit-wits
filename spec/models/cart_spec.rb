describe Cart do
  describe "instance methods" do
    subject {Cart.new({"1"=>2, "4"=>3})}

    describe "#total_count" do
      it "can calculate total number of items in cart" do
        expect(subject.total_count).to eq(5)
      end
    end

    describe "#count_of" do
      it "can count quantity of single item in cart" do
        expect(subject.count_of(1)).to eq(2)
      end
    end

    describe "#add_item" do
      it "can add item to cart with items" do
        subject.add_item(1)
        subject.add_item(4)

        expect(subject.contents).to eq({"1"=>3, "4"=>4})
      end

      it "can add item to empty cart" do
        cart = Cart.new(nil)
        cart.add_item(1)

        expect(cart.contents).to eq("1"=>1)
      end
    end
  end
end
