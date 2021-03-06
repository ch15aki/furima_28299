class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city_suburb, :house_number, :building_name, :phone_number, :user_id, :item_id

  POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze

  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_CODE_REGEX, message: 'is invalid. Include hyphen(-)' }
    validates :city_suburb, :house_number
    validates :phone_number, length: { with: /\d/, maximum: 11, message: 'is invalid. Exclude hyphen(-)' }
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city_suburb: city_suburb,
      house_number: house_number,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
