require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include"Nickname can't be blank"
      # nicknameが空では登録できないテストコードを記述します
    end
    it 'emailが空では登録できない' do
      @user.email = ''  # emailの値を空にする__
      @user.valid?
      expect(@user.errors.full_messages).to include"Email can't be blank"
      # emailが空では登録できないテストコードを記述します
    end
  end
end
