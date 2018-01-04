FactoryBot.define do
  factory :category do
    sequence :name do |n|
      "sweater#{n}"
    end
  end
end
