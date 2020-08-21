class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :find_item

  def new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def move_to_index
    @item = Item.find(params[:item_id])
    if (current_user.id == @item.user.id) || @item.order then
      redirect_to root_path
    end
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(
      :token, :postal_code, :prefecture_id, :city_suburb, :house_number, :building_name, :phone_number
    ).merge(
      user_id: current_user.id, item_id: @item.id
    )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
