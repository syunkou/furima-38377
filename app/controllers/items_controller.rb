class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show,:new]

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end


  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :status_id, :delivery_charge_id, :sender_id, :shippedd_date_id, :image).merge(user_id: current_user.id)
  end  


  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
