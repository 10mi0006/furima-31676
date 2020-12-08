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
    validates :price                  
  end


end

