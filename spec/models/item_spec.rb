require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank.")
    end

    it 'item_nameが空では登録できないこと' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it 'descriptionが空では登録できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'categoryの情報が空では登録できないこと' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category select')
    end

    it 'conditionの情報が空では登録できないこと' do
      @item.condition = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition select')
    end

    it 'shipping_day_idの情報が空では登録できないこと' do
      @item.shipping_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping day select')
    end

    it 'shipping_cost_idの情報が空では登録できないこと' do
      @item.shipping_cost_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping cost select')
    end

    it 'prefectureの情報が空では登録できないこと' do
      @item.prefecture = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture select')
    end

    it 'priceの情報が空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it 'priceが、¥300未満だと登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it 'priceが、¥10,000,000以上だと登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
  end
end
