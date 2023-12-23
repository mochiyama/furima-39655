require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context  'ユーザ登録ができる時' do 
    it '必要情報が入力されていると登録できる' do
      expect(@user).to be_valid
    end
  end
  
  context  'ユーザ登録ができない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include"Nickname can't be blank"
    end 

    it 'emailが空では登録できない' do
      @user.email = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include"Email can't be blank"
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'password_confirmationが一致しないと登録できない' do
      @user.password_confirmation = 'mismatched_password'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'last_name_kanjiが空では登録できない' do
      @user.last_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kanji can't be blank"
    end

    it 'first_name_kanjiが空では登録できない' do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kanji can't be blank"
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it 'birth_dayが空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが6文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name_kanji = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanji 全角文字を使用してください')
      end

      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name_kanji = 'ﾀｶｼ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji 全角文字を使用してください")
      end

      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_kana = 'あ,山,1,*'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana カタカナを使用してください')

      end

      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'あ,山,1,*'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana カタカナを使用してください')
      end

 end
end
