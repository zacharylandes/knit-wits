describe ItemCategory do
  describe "relationships", type: :model do
    it {should belong_to :item}
    it {should belong_to :category}
  end
end
