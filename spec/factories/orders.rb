FactoryBot.define do
  factory :order do
    status 0
    street "123 Main St"
    city "Denver"
    state 1
    zipcode 80525
    full_name "Max"
    user
  end
end
