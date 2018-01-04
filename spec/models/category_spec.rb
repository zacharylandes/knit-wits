describe Category do
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
