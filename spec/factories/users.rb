FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    name { "Test User" }
    location { "Berlin" }

    after(:create) do |user|
      user.hobbies << create(:hobby)
    end
  end
end
