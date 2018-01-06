FactoryBot.define do
  factory :user do
    sequence :username do |n|
      "user #{n}"
    end
    password "password"
    role 0
  end

  factory :admin, class: User do
    username "admin"
    password "password"
    role 1
  end
end
