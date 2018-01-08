FactoryBot.define do
  factory :item do
    sequence :title do |n|
      "cool mitten #{n}"
    end
    description "super warm"
    price 5000
    image "image.jpeg"
    status 1
    transient do
      category_count 2
    end
    after(:create) do |item, evaluator|
      create_list(:item_category, evaluator.category_count, item: item)
    end
  end
end
