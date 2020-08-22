class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  FULL_WIDTH_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  FULL_WIDTH_KANE_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  with_options presence: true do
    validates :nickname, :birthday
    validates :first_name, :last_name, format: { with: FULL_WIDTH_REGEX, message: 'is invalid. Input full-width characters.' }
    validates :first_name_reading, :last_name_reading, format: { with: FULL_WIDTH_KANE_REGEX, message: 'is invalid. Input full-width katakana characters.' }
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Input half-width alphanumeric characters.'
end
