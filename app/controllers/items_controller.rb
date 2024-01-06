class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index , :show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
    #@user = User.find(params[:id])
  end

  #def edit
    #@item = Item.find(params[:id])
  #end 

  private
  def item_params
    params.require(:item).permit(:image, :price, :item_name, :description, :category_id, :condition_id, :shipping_fee_id, :ship_from_id, :shipping_date_id).merge(user_id: current_user.id)
  end

end