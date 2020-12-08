class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one  :buy
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name                  
    validates :explanation         
    validates :condition_id,        numericality: { other_than: 0 }           
    # validates :user_id       
    validates :category_id,         numericality: { other_than: 0 }                     
    validates :delivery_fee_id,     numericality: { other_than: 0 } 
    validates :shipment_address_id, numericality: { other_than: 0 } 
    validates :shipping_days_id,    numericality: { other_than: 0 } 
    validates :price,                numericality: { greater_than_or_equal_to: 299, less_than_or_equal_to: 10000000, message: "is out of setting range"}
  end


end

