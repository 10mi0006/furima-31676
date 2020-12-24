class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :move_to_root_path, except: [:index, :show, :search], unless: :user_signed_in?

  def index
    @items = Item.all.order(created_at: :desc)
    

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

  def show
  end

  def edit
    redirect_to root_path if current_user.id != @item.user.id || @item.buy.present?
  end

  def update
    if @item.update(item_params)
       redirect_to items_path,notice: "変更しました" 
    else
       render :edit
    end
  end

  def destroy
    redirect_to root_path unless current_user == @item.user
    if @item.destroy
      flash[:notice] = "削除が完了しました"
      redirect_to root_path
    else
      flash[:alert] = "削除できませんでした"
      render :show
    end
   end

  
   


  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :delivery_fee_id, :shipment_address_id, :shipping_days_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root_path
    redirect_to root_path 
    flash[:alert] = "出品するには新規登録、ログインが必要です"
  end

end

