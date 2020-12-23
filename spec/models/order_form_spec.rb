require 'rails_helper'

describe  OrderForm do

  before do
    @order_form = FactoryBot.build(:order_form)
  end
  
  describe '#create' do

    context '商品購入ができる時' do
     
    
    it "全ての項目の入力が存在すれば登録できること" do
      expect(@order_form).to be_valid
     end

     it "建物名は空白でも登録できること" do
      @order_form.house_number = ""
      @order_form.valid?
      expect(@order_form).to be_valid
    end


    end

    context '商品購入ができない時' do

    it "郵便番号が空ならば、登録できないかテストする" do
      @order_form.postcode = ""
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Postcode can't be blank"
    end

    it "shipment_address_idが、0だと登録できない" do
      @order_form.shipment_address_id = 0
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Shipment address must be other than 0" 
     end
 
     it "shipment_address_idが、空だと登録できない" do
      @order_form.shipment_address_id = ""
      @order_form.valid?
       expect(@order_form.errors.full_messages).to include "Shipment address can't be blank" 
      end

    it "市区町村が空ならば、登録できないかテストする" do
      @order_form.municipality = ""
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Municipality can't be blank" 
    end

    it "番地が空ならば、登録できないかテストする" do
      @order_form.address = ""
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Address can't be blank" 
    end

   

    it "電話番号が空ならば、登録できないかテストする" do
      @order_form.phone_number = ""
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Phone number can't be blank" 
    end

    it "電話番号が12桁以上だと登録できない" do
      @order_form.phone_number = "111111111111"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Phone number is invalid." 
     end

     it "電話番号にハイフンを含む場合は登録できない" do
      @order_form.phone_number = "-"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Phone number is invalid." 
     end
 

    it "user_idが空ならば、登録できないかテストする" do
      @order_form.user_id = ""
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "User can't be blank" 
    end

    it "item_idが空ならば、登録できないかテストする" do
      @order_form.item_id = ""
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Item can't be blank" 
    end

    it "-がない場合は登録できないこと" do
      @order_form.postcode = "1111111"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Postcode is invalid. Include hyphen(-)"
    end

  end

  end
end