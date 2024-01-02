class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index] #, :show]


  def index
  #  @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path #12/31コメントアウトから復活
      #redirect_to @item, notice: 'アイテムを作成しました。' #12/30 chatGPTアドバイスにより追加 #12/31 コメントアウト
    else
      #puts @item.errors.full_messages # ターミナルにエラーメッセージを表示 12/30 chatGPTアドバイスにより追加
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :price, :item_name, :description, :category_id, :condition_id, :shipping_fee_id, :ship_from_id, :shipping_date_id).merge(user_id: current_user.id)
  end

end