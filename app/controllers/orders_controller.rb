class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :move_to_root_path, except: [:index]
  before_action :item_find, only: [:index, :create]
  
  def index
    @order_form = OrderForm.new
    redirect_to root_path if current_user.id == @item.user_id || @item.buy.present?
  end

  def new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      # 決済処理を移動
       pay_item
      #決済処理を移動
       @order_form.save
        return redirect_to root_path
    else
      render action: :index
    end
  end

  
  private
  def order_params                                                      
    params.require(:order_form).permit(:postcode, :prefecture_id, :municipality, :address, :house_number, :phone_number,:shipment_address_id).merge(token: params[:token], user_id: current_user.id, item_id:@item.id )
    
  end

  def pay_item
  # 決済処理を記述しましょう
    # 秘密鍵代入した環境変数を呼び込み
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    # 秘密鍵代入した環境変数を呼び込み
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  # 決済処理を記述しましょう
  end
  
  def move_to_root_path
    redirect_to root_path 
    flash[:alert] = "購入するには新規登録、ログインが必要です"
  end

  def item_find
  @item = Item.find(params[:item_id])
  end

end

