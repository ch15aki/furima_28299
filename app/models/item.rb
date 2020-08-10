class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture, :shipping_cost, :shipping_days, :condition, :category
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :prefecture, :shipping_cost, :shipping_days, :condition, :category
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id, :shipping_cost_id, :shipping_days_id, :condition_id, :category_id
  end
end
