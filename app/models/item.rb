class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :condition
  belongs_to_active_hash :category

  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :item_name, :description, :image
  end

  validates :prefecture, :shipping_cost, :shipping_day, :condition, :category, numericality: { message: 'select' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
