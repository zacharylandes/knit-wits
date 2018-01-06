FactoryBot.define do
  factory :user do
    sequence :username do |n|
      "user #{n}"
    end
    password "password"
    street "123 Main St"
    city "Denver"
    state 1
    zipcode 80525
    full_name "Max"
    role 0
  end

  factory :admin, class: User do
    username "admin"
    password "password"
    street "123 Main St"
    city "Denver"
    state 1
    zipcode 80525
    full_name "Max"
    role 1
  end
end
