class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :condition
  belongs_to_active_hash :category

  belongs_to :user
  has_one :order

  has_one_attached :image

  with_options presence: true do
    validates :item_name, :description
  end

  validates :prefecture_id, :shipping_cost_id, :shipping_day_id, :condition_id, :category_id, numericality: { only_integer: true, message: 'select' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  validate :was_attached?

  def was_attached?
    errors.add(:image, "can't be blank.") unless image.attached?
  end
end
