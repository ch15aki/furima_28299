FactoryBot.define do
  factory :item do
    item_name { 'グルーツバンド' }
    description { '家トレで使える最強トレーニングバンドのセット！' }
    price { 10_000 }
    shipping_cost_id { 1 }
    prefecture_id { 1 }
    shipping_day_id { 1 }
    condition_id { 1 }
    category_id { 1 }
    association :user
  end
end
