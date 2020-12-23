class OrderForm

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :shipment_address_id, :municipality, :address, :house_number, :phone_number,:token

         
  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number ,format: {with: /\A\d{10}\z|\A\d{11}\z/ ,less_than_or_equal_to: 99999999999, message: "is invalid."}
    validates :token
    validates :shipment_address_id, numericality: { other_than: 0 } 
    validates :user_id
    validates :item_id
  end

  #データをテーブルに保存する処理


    def save
       # オーターの情報を保存し、「order」という変数に入れている
      buy = Buy.create(user_id: user_id, item_id: item_id)

      # カードの情報を保存
      Order.create(postcode: postcode,  shipment_address_id: shipment_address_id, municipality: municipality, address: address, house_number: house_number, phone_number:phone_number,buy_id: buy.id)
    end
    # データをテーブルに保存する処理
end
