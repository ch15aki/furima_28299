require 'rails_helper'

RSpec.describe '商品新規出品', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  context '新規出品ができるとき' do
    it 'ログインしたユーザーは新規出品できる' do
      # ログインする
      sign_in(@user)
      # 新規出品ページへのリンクがあることを確認する
      expect(page).to have_content('出品する')
      # 出品ページに移動する
      visit new_item_path

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # フォームに情報を入力する
      attach_file('item[image]', image_path, make_visible: true)
      fill_in 'item-name', with: @item.item_name
      fill_in 'item-info', with: @item.description
      select('レディース', from: 'item-category')
      select('新品、未使用', from: 'item-sales-status')
      select('送料込み(出品者負担)', from: 'item-shipping-fee-status')
      select('神奈川県', from: 'item-prefecture')
      select('1~2日で発送', from: 'item-scheduled-delivery')
      fill_in 'item-price', with: @item.price

      # 送信するとitemモデルのカウントが1上がることを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Item.count }.by(1)
      # 「編集する」の文字があることを確認する
      expect(page).to have_content('商品の編集')
      # トップページに遷移する
      visit root_path
      # トップページには先ほど投稿した内容の画像が存在することを確認する（画像）
      expect(page).to have_selector('img')
      # トップページには先ほど投稿した内容の商品名、価格が存在することを確認する（商品名）
      expect(page).to have_content(@item.item_name)
      expect(page).to have_content(@item.price)
    end
  end
  context 'ツイート投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 出品ボタンがあることを確認する
      expect(page).to have_content('出品する')
      # 出品ボタンを押す
      click_on('出品する')
      # ログインページへ戻されることを確認する、後で修正
      # expect(current_path).to eq root_path
    end
  end
end
