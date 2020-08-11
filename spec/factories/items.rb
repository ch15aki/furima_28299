FactoryBot.define do
  factory :item do
    item_name {Faker::String.random}
    description {Faker::Lorem.sentence}
    price {Faker::Number.within(range: 300..9999999)}
    shipping_cost_id {Faker::Number.within(range: 1..2)}
    prefecture_id {Faker::Number.within(range: 1..47)}
    shipping_day_id {Faker::Number.within(range: 1..3)}
    condition_id {Faker::Number.within(range: 1..6)}
    category_id {Faker::Number.within(range: 1..10)}
    association :user
  end
end
