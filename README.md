# README

# DB設計

## usersテーブル
|Column|Type|options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null:false,unique:true|
|password|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthday|date|null:false|
### Association
- has_one :address
- has_many :selling_products, foreign_key: "seller_id", class_name: "Product"

## creditcardテーブル
|Column|Type|options|
|------|----|-------|
|user|references|null:false,foreign_key:true|
|customer_id|string|null:false|
|card_id|string|null:false|
### Association
- belongs_to :user

## addressテーブル
|Column|Type|options|
|------|----|-------|
|post_code|string|null:false|
|prefecture_id|integer|
|city|string|null:false|
|house_number|string|null:false|
|building|string||
|phone_number|string|
|user|references|null:false,foreign_key:true|
### Association
- belongs_to_active_hash :prefecture
- belongs_to :user, optional: true


## productsテーブル
|Column|Type|options|
|------|----|-------|
|name|string|null:false|
|explanation|text|null:false|
|sales_status|string|
|price|integer|null:false|
|brand|string|
|status_id|bigint|null:false,foreign_key:true|
|delivery_fee_id|bigint|null:false,foreign_key:true|
|shipping_area|bigint|null:false,foreign_key:true|
|shipping_day|bigint|null:false,foreign_key:true|
|category_id|bigint|null:false,foreign_key:true|
|seller|references|null:false,foreign_key: { to_table: :users}|

### Association
- belongs_to :seller, class_name: "User"
- belongs_to :category
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images, allow_destroy: true
- has_one :order
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :shipping_day


## imagesテーブル
|Column|Type|options|
|------|----|-------|
|image|string|
|product|references|null:false,foreign_key:true|
### Association
- belongs_to :product
- mount_uploader :image

## categoriesテーブル
|Column|Type|options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
- has_many :products
- has_ancestry
