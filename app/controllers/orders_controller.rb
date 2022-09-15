class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_seller, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:zipcode, :prefecture_id, :city, :address1, :address2, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_seller
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id 
  end
end