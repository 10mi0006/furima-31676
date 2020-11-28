require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '#create' do

      # 入力されている場合のテスト ▼

      it "全ての項目の入力が存在すれば登録できること" do
        expect(@user).to be_valid
      end

      # nul:false, presence: true のテスト ▼

      it "nicknameがない場合は登録できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it "emailがない場合は登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "passwordがない場合は登録できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "password_confirmationがない場合は登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "last_nameがない場合は登録できないこと" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it "last_name_kanaがない場合は登録できないこと" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it "first_nameがない場合は登録できないこと" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it "first_name_kanaがない場合は登録できないこと" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it "birthdayがない場合は登録できないこと" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it "@がない場合は登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank", "Email is invalid"
      end


      # パスワードの文字数テスト ▼

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "1"
        @user.valid? 
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it "passwordが数字のみだと登録できないこと" do
        @user.password = "11"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it "passwordが英字のみだと登録できないこと" do
        @user.password = "aa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      # email 一意性制約のテスト ▼

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      # 確認用パスワードが必要であるテスト ▼

      it "passwordが存在してもencrypted_passwordがない場合は登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      # 本人確認名前全角入力のテスト ▼

      it 'last_nameが全角入力でなければ登録できないこと' do
        @user.last_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end

      it 'first_nameが全角入力でなければ登録できないこと' do
        @user.first_name = "a"
        @user.valid?
        expect(@user.errors[:first_name]).to include("is invalid")
      end

      # 本人確認カタカナ全角入力のテスト ▼

      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.last_name_kana = "a"
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include("is invalid")
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.first_name_kana = "a"
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("is invalid")

      end
    end
  end
