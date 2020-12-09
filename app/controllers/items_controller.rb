class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    #@items = Item.all

  end

  def new
    @item = Item.new
  end

  def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path, notice: "出品しました" 
      else
        render :new
        flash[:notice] = "出品に失敗しました" 
      end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :delivery_fee_id, :shipment_address_id, :shipping_days_id,:price,:image,).merge(user_id: current_user.id)
  end
end

