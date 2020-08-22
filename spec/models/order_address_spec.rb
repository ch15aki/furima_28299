require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @order = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order).to be_valid
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it 'prefecture_idを選択していないと保存できないこ' do
      @order.prefecture_id = 0
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'city_suburbが空だと保存できないこと' do
      @order.city_suburb = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City suburb can't be blank")
    end

    it 'house_numberが空だと保存できないこと' do
      @order.house_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("House number can't be blank")
    end

    it 'building_nameは空でも保存できること' do
      @order.building_name = nil
      expect(@order).to be_valid
    end

    it 'phone_numberが半角のハイフンを含まない正しい形式でないと保存できないこと' do
      @order.phone_number = '090-1234-5678'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid. Exclude hyphen(-)')
    end

    it 'phone_numberが12文字以上だと保存できないこと' do
      @order.phone_number = '012345678912'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid. Exclude hyphen(-)')
    end
  end
end
