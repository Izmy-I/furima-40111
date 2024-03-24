class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  
  def order_params
    params.require(:order_destination).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    return if @item.user_id != current_user.id && @item.order.blank?
    redirect_to root_path
  end
end
