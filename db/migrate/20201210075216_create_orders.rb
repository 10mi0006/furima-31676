class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :buy_id ,foreign_key: true
      t.string  :postcode ,null:false
      t.string  :municipality ,null: false
      t.string  :address ,null: false
      t.string  :house_number ,null: false
      t.integer :shipment_address_id,    null: false
      t.string  :phone_number ,null: false
      t.timestamps
    end
  end
end
