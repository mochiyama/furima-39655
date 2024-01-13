class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @order_form = OrderForm.new
  end

def create
     @order_form = OrderForm.new(order_params)

     if @order_form.valid?
        purchased_item
        @order_form.save
        redirect_to root_path
     else
        gon.public_key = ENV["PAYJP_PUBLIC_KEY"]  #1/13 20:00追記

        render :index, status: :unprocessable_entity
     end
end

private
    def order_params
       params.require(:order_form).permit(:zip_code, :ship_from_id, :city, :street_number, :name_of_building, :telephone_number) .merge(item_id: params[:item_id], user_id: current_user.id ,token: params[:token]) 
    end

 
    def purchased_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: order_params[:token], 
        currency: 'jpy'      
      )
    end

    def non_purchased_item
      @item = Item.find(params[:item_id])
      redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
    end

end