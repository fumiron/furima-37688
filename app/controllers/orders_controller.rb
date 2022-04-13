class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
    if @item.user_id == current_user.id || @item.order
      redirect_to root_path 
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_delivery_params)
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_delivery_params
    params.require(:order_delivery).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
      Payjp.api_key = "sk_test_b99bc4c21e31a2352076f62b"  
      Payjp::Charge.create(
        amount: @item.price, 
        card: order_delivery_params[:token],   
        currency: 'jpy'
      )
  end
end
