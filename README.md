
## userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|encrypted_password|String|null: false|
|first_name|String|null: false|
|last_name|String|null: false|
|first_name_kana|String|null: false|
|last_name_kana|String|null: false|
|birthday|date|null: false|

### Association
- has_many :items
- has_many :buys
- 




## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|Integer|foreign_key: true|
|name|String|null: false|
|condition_id|Integer|null: false|
|explanation|text|null: false|
|category_id|Integer|null: false|
|delivery_fee_id|Integer|null: false|
|shipment_address_id|Integer|null: false|
|shipping_days_id|Integer|null: false|
|price|Integer|null: false|

### Association
- has_one  :buy
- belongs_to :user



## addressテーブル
|Column|Type|Options|
|------|----|-------|
|buy_id|Integer|foreign_key: true|
|postcode|String|null:false|
|prefecture_id|Integer|null: false|
|municipality|String|null: false|
|address|String|null: false|
|house_number|String|
|phone_number|String|null: false|


### Association
- belongs_to :buy



### buyテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|Integer|foreign_key: true|
|user_id|Integer|foreign_key: true|

### Association
- has_one:address
- belongs_to :user
- belongs_to :item

