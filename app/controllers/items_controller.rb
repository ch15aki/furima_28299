class ItemsController < ApplicationController
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
    params.require(:item).permit(:image, :item_name, :description, :price, :shipping_cost_id, :prefecture_id, :shipping_day_id, :condition_id, :category_id).merge(user: current_user.id)
  end
end
