class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :move_to_index, except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :user_login, only: [:edit, :destroy]


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
      render :new
    end
  end

  def show
  end  

  def edit
    if @item.user_id == current_user.id && @item.order.nil?
    else
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(item_params)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shippedd_date_id, :image).merge(user_id: current_user.id)
  end

  def set_item
   @item = Item.find(params[:id])
  end

  def  user_login
    @item.user_id == current_user.id
  end


  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
