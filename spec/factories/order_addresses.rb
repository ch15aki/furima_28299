FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city_suburb { '横浜市' }
    house_number { '西区1' }
    building_name { 'みなとみらい' }
    phone_number { '0123456789' }
  end
end
