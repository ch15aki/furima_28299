class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :prefecture
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end
end
