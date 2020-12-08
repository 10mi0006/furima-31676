class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                   null: false
      t.text       :explanation,            null: false
      t.integer    :condition_id,           null: false
      t.integer    :user_id,                null: false
      t.integer    :category_id,            null: false
      t.integer    :delivery_fee_id,        null: false
      t.integer    :shipment_address_id,    null: false
      t.integer    :shipping_days_id,       null: false
      t.integer    :price,                  null: false
      t.timestamps
    end
    # add_foreign_key :items, :users, column: :user_id
  end
end