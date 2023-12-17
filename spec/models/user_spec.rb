require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end



    context '新規登録できる' do
      it 'nicknameが入力されていると登録できる' do
        expect(@user.nickname).to be_valid
        end
      end

    context '新規登録できない' do
      it 'nicknameが空では登録できない' do
      @user.nickname = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include"Nickname can't be blank"
      end 
    end

    context '新規登録できる' do
      it 'emailが入力されていると登録できる'  do
        expect(@user.email).to be_valid
        end
      end

      context '新規登録できない' do
      it 'emailが空では登録できない' do
        @user.email = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include"Email can't be blank"
        end
      end

    context '新規登録できる' do
      it 'passwordが入力されていると登録できる' do
        expect(@user.password).to be_valid
        end
      end

    context '新規登録できない' do
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
        end
      end

    context '新規登録できる' do
      it 'password_confirmationが一致していると登録できる' do
        expect(@user.password_confirmation).to be_valid
        end
      end

    context '新規登録できない' do
      it 'password_confirmationが一致しないと登録できない' do
        @user.password_confirmation = 'mismatched_password'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
        end
      end

    context '新規登録できる' do
      it 'last_name_kanjiが入力されていれば登録できる' do
        expect(@user.last_name_kanji).to be_valid
        end
      end

    context '新規登録できない' do
     it 'last_name_kanjiが空では登録できない' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kanji can't be blank"
        end
     end

     context '新規登録できる' do
     it 'first_name_kanjiが入力されていれば登録できる' do
        expect(@user.first_name_kanji).to be_valid
        end
      end

     context '新規登録できない' do
      it 'first_name_kanjiが空では登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kanji can't be blank"
        end
      end

     context '新規登録できる' do
      it 'last_name_kanaが入力されていれば登録できる' do
          expect(@user.last_name_kana).to be_valid
          end
      end

      context '新規登録できない' do
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
        end
      end

      context '新規登録できる' do
      it 'first_name_kanaが入力されていれば登録できる' do
         expect(@user.first_name_kana).to be_valid 
         end
      end

      context '新規登録できない' do
     it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
        end
     end

    context '新規登録できる' do
      it 'birth_dayが入力されていれば登録できる' do
        expect(@user.birth_day).to be_valid 
        end
      end

    context '新規登録できない' do
    it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
        end
    end
  end
 end
end
