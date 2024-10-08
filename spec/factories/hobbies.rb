FactoryBot.define do
  factory :hobby do
    sequence(:name) { |n| "Hobby #{n}" }
  end
end
