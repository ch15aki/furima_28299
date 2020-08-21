class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city_suburb, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city_suburb, :house_number
    validates :phone_number, format: {with: /\d{9,11}/, message: "is invalid. Exclude hyphen(-)"}
  end

  validates :prefecture_id, numericality: { only_integer: true, message: 'select' }

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