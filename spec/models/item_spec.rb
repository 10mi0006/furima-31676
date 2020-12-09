require 'rails_helper'


  
describe Item do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '#create' do
    it "商品名が空ならば、登録できないかテストする" do
     @item.name = ""
     @item.valid?
     expect(@item.errors.full_messages).to include "Name can't be blank"
    end
  end

  describe '#create' do
    it "説明が空ならば、登録できないかテストする" do
     @item.explanation = ""
     @item.valid?
     expect(@item.errors.full_messages).to include "Explanation can't be blank"
    end
  end

  describe '#create' do
    it "値段が空ならば、登録できないかテストする" do
     @item.price = ""
     @item.valid?
     expect(@item.errors.full_messages).to include "Price can't be blank" 
    end
  end

  describe '#create' do
    it "category_idが、0だと登録できない" do
     @item.category_id =  0
     @item.valid?
     expect(@item.errors.full_messages).to include "Category must be other than 0" 
    end
  end

  describe '#create' do
    it "condition_idが、0だと登録できない" do
     @item.condition_id = 0
     @item.valid?
     expect(@item.errors.full_messages).to include "Condition must be other than 0"
    end
  end

  describe '#create' do
    it "delivery_fee_idが、0だと登録できない" do
     @item.delivery_fee_id = 0
     @item.valid?
     expect(@item.errors.full_messages).to include "Delivery fee must be other than 0"
    end
  end

  describe '#create' do
    it "shipment_address_idが、0だと登録できない" do
     @item.shipment_address_id = 0
     @item.valid?
     expect(@item.errors.full_messages).to include "Shipment address must be other than 0"
    end
  end

  describe '#create' do
    it "shipping_days_idが、0だと登録できない" do
     @item.shipping_days_id = 0
     @item.valid?
     expect(@item.errors.full_messages).to include "Shipping days must be other than 0"
    end
  end

  describe '#create' do
    it "priceが299円以下だと登録できない" do
     @item.price = 1
     @item.valid?
     expect(@item.errors.full_messages).to include "Price is out of setting range"
    end
  end

  describe '#create' do
    it "priceが9999999以上だと登録できない" do
     @item.price = 10000000
     @item.valid?
     expect(@item.errors.full_messages).to include "Price is out of setting range"
    end
  end
end
