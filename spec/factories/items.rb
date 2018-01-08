FactoryBot.define do
  factory :item do
    sequence :title do |n|
      "cool mitten #{n}"
    end
    description "super warm"
    price 5000
    category
    image "image.jpeg"
    status 1
  end
end
