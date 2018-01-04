class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || Hash.new(0)
  end

  def items
    contents.keys
  end

  def total_count
    contents.values.sum
  end

  def count_of(id)
    contents[id.to_s]
  end

  def add_item(id)
    contents[id.to_s] += 1
  end

  def remove_item(id)
    contents.delete(id.to_s)
  end
end
