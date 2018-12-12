# DB設計

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## credit_cardテーブル

|Column|Type|Options|
|------|----|-------|
|number|string|null: false, unique: true|
|security_code|integer|null: false|
|expiration_month|integer|null: false|
|expiration_year|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer| |
|birth_month|integer| |
|birth_day|integer| |
|email|string|null: false, unique: true|
|password|string|null: false|
|phone_number|integer| |
|nickname|string|null: false|
|avatar|string| |
|introduction|text| |

### Association
- has_many :items
- has_many :orders
- has_many :comments
- has_one :credit_card
- has_one :address


## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|depth|string| |
|size_pulldown|integer|null: false|

### Association
- has_many :items


## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|status|integer|null: false|

### Association
- belongs_to :item
- belongs_to :user


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :items


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|string|null: false|
|price|integer|null: false|
|condition|integer|null: false|
|shipping_from|integer|null: false|
|shipping_date|integer|null: false|
|shipping_fee|integer|null: false|
|shipping_way|integer|null: false|
|size|string|null: false|
|user_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- has_many :images
- has_many :comments
- belongs_to :category
- belongs_to :brand
- belongs_to :user
- has_one :order


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street_number|string|null: false|
|building_name|string| |
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
