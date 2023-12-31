require 'rails_helper'

RSpec.describe Item, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  ##以下、user_spec.rbからコピーを改修した

  context  '商品登録ができる時' do 
    it '必要情報が入力されていると登録できる' do
      expect(@item).to be_valid
    end
  end
  
  context  '商品登録ができない時' do

    it 'imageが空では登録できない' do
      @item.image = nil 
      @item.valid?
      expect(@item.errors.full_messages).to include"Image can't be blank"
    end

    it '商品名が空では登録できない' do
      @item.item_name = '' 
      @item.valid?
      expect(@item.errors.full_messages).to include"Item name can't be blank"
    end 

    it '商品の説明が空では登録できない' do
      @item.description = '' 
      @item.valid?
      expect(@item.errors.full_messages).to include"Description can't be blank"
    end

    it 'カテゴリーが1以上でなければ登録できない' do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end

    it '商品の状態が1以上でなければ登録できない' do
      @item.condition_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end

    it '配送料の負担が1以上でなければ登録できない' do
      @item.shipping_fee_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
    end

    it '発送元の地域が1以上でなければ登録できない' do
      @item.ship_from_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Ship from can't be blank"
    end

    it '発送までの日数が1以上でなければ登録できない' do
      @item.shipping_date_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping date can't be blank"
    end

    it 'Priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    it 'Priceは半角数字以外では登録できない' do
      @item.price= '１２３４'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than 299 or less than 10000000"
      end

    it 'Priceは300円未満では登録できない' do
        @item.price= '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than 299 or less than 10000000"
    end

    it 'Priceは9999999円以上では登録できない' do
       @item.price= '10000000'
       @item.valid?
       expect(@item.errors.full_messages).to include "Price must be greater than 299 or less than 10000000"
    end

    it 'userが紐づいていなければ出品できない' do
      @item.user= nil
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
   end

##以上、user_spec.rbからコピーを改修した

 end
end
