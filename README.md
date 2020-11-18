
## userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|address|string|null: false|
|password|String|null: false|

### Association
- has_many :items
- has_many :buy



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|Integer|foreign_key: true|
|item_name|String|null: false|
|images|String|null: false|
|price|Integer|null: false|
|condition|Integer|null: false|
|items_text|String|null: false|
|information|String|
|delivery_fee|Integer|null: false|
|shipment_address|String|null: false|
|shipping_days|String|null: false|
|price_information|Integer|null: false|

### Association
- has_one  :buy
- belongs_to :user



## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postcode|Integer|null:false|
|prefectures|String|null: false|
|municipality|String|null: false|
|house_number|String|null: false|
|phone_number|String|null: false|


### Association
- belongs_to :buy



### buyテーブル
|Column|Type|Options|
|------|----|-------|
|items_id|Integer|foreign_key: true|
|user_id|Integer|foreign_key: true|
|when|datetime|unique: true|

### Association
- has_one:address