class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  before_action :move_to_index, except: [:index]
  #before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
     if @item.save
       redirect_to root_path
     else
       render new_item_path
     end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :status_id, :delivery_charge_id, :sender_id, :shippedd_date_id, :image).merge(user_id: current_user.id)
  end

  #def set_item
   #@item = Item.find(params[:id])
  #end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
