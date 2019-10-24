FactoryBot.define do
  factory :user do
    name { "Товарисч_#{rand(735)}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password {"password"}
    password_confirmation {"password"}
  end
end
