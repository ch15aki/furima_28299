require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "すべての値が正しく入力されていれば保存できること" do
      expect(@user).to be_valid
    end

    # ユーザー情報
    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    
    it "emailは@を含む必要があること" do
      @user.email = @user.email.sub(/@/,'')
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
        
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordは6文字以上であると登録ができる" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      @user.valid?
    end

    it "passwordは5文字以下だと登録はできない" do
      @user.password = "test5"
      @user.password_confirmation = "test5"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordは数字のみだと登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is valid. Input half-width alphanumeric characters.")
    end

    it "passwordは英字のみだと登録できない" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is valid. Input half-width alphanumeric characters.")
    end

    it "passwordは全角英字だと登録できない" do
      @user.password = "ａbｃｄｅf"
      @user.password_confirmation = "ａbｃｄｅf"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is valid. Input half-width alphanumeric characters.")
    end

    # 本人情報確認
    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_nameは全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.first_name = "sakurai"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "last_nameは全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.last_name = "ｹﾝｲﾁ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end

    it "first_name_readingが空だと保存できないこと" do
      @user.first_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end

    it "first_name_readingが全角（カタカナ）でないと保存できないこと" do
      @user.first_name_reading = "なかがわ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters.")
    end

    it "last_name_readingが空だと保存できないこと" do
      @user.last_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank")
    end

    it "last_name_readingが全角（カタカナ）でないと保存できないこと" do
      @user.last_name_reading = "ｼﾞｪﾝ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading is invalid. Input full-width katakana characters.")
    end

    it "birthdayが空だと保存できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end

end
