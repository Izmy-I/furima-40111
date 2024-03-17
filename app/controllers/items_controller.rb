class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    # @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def item_params
    params.require(:item).permit(
      :item_name, :description, :category_id, :condition_id, :fee_pay_id, :prefecture_id, :delivery_day_id, :price, :image
      ).merge(user_id: current_user.id)
  end

end
