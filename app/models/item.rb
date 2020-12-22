class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :shipment_address
  belongs_to :shipping_days
  belongs_to :condition
  has_one  :buy
  belongs_to :user

  with_options presence: true do
    validates :name                  
    validates :explanation         
    validates :condition_id,        numericality: { other_than: 0 }           
    # validates :user_id       
    validates :category_id,         numericality: { other_than: 0 }                     
    validates :delivery_fee_id,     numericality: { other_than: 0 } 
    validates :shipment_address_id, numericality: { other_than: 0 } 
    validates :shipping_days_id,    numericality: { other_than: 0 } 
    validates :price,               numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end


end

