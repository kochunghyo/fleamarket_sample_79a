# README

# DB設計

## usersテーブル
|Column|Type|options|
|------|----|-------|
|nickname|string|null:false|
|mail|string|null:false,unique:true|
|password|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthday|date|null:false|
### Association
- has_one :creditcard
- has_many :orders
- has_one :address
- has_many :products

## creditcardテーブル
|Column|Type|options|
|------|----|-------|
|user_id|references|null:false,foreign_key:true|
|customer_id|string|null:false|
|card_id|string|null:false|
### Association
- belongs_to :user

## addressテーブル
|Column|Type|options|
|------|----|-------|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|post_code|string|null:false|
|prefectures|references|null:false,foreign_key:true|
|city|string|null:false|
|house_number|string|null:false|
|building|string||
|phone_number|string||null:false|
|user_id|references|null:false,foreign_key:true|
### Association
- belongs_to_active_hash :prefecture

## ordersテーブル
|Column|Type|options|
|------|----|-------|
|product_id|references|null:false,foreign_key:true|
|user_id|references|null:false,foreign_key:true|
### Association
- belongs_to :user
- belongs_to :product

## productsテーブル
|Column|Type|options|
|------|----|-------|
|name|string|null:false|
|explanation|text|null:false|
|status|references|null:false,foreign_key:true|
|delivery_fee|references|null:false,foreign_key:true|
|shipping_area|references|null:false,foreign_key:true|
|shipping_day|references|null:false,foreign_key:true|
|price|integer|null:false|
|user_id|references|null:false,foreign_key:true|
|category_id|bigint|null:false,foreign_key:true|
|brand_id|bigint|foreign_key:true|
|image_id|references|null:false,foreign_key:true|
### Association
- belongs_to :user
- belongs_to :category
- has_many :brands
- has_many :images
- has_one :order
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :shipping_day


## imagesテーブル
|Column|Type|options|
|------|----|-------|
|image|string|null:false|
|product_id|references|null:false,foreign_key:true|
### Association
- belongs_to :product

## brandsテーブル
|Column|Type|options|
|------|----|-------|
|name|string|
### Association
- belongs_to :product

## categoriesテーブル
|Column|Type|options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|null:false|
### Association
- has_many :products
=======

## user_informationテーブル
|Column|Type|options|
|------|----|-------|
|post_code|string|null:false|
|prefectures|string|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building|string|ー|
|phone_number|string|null:false|
|user_id|reference|null:false,foreign_key:true|
### Association
- belongs_to :user

## creditcardテーブル
|Column|Type|options|
|------|----|-------|
|user_id|reference|null:false,foreign_key:true|
|customer_id|string|null:false|
|card_id|string|null:false|
### Association
- belongs_to :user

## addressテーブル
|Column|Type|options|
|------|----|-------|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|post_code|string|null:false|
|prefectures|string|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building|string||
|phone_number|string||
|user_id|reference|null:false,foreign_key:true|
### Association
- belongs_to :user

## ordersテーブル
|Column|Type|options|
|------|----|-------|
|product_id|reference|null:false,foreign_key:true|
|user_id|reference|null:false,foreign_key:true|
### Association
- belongs_to :user
- belongs_to :product

## productsテーブル
|Column|Type|options|
|------|----|-------|
|name|string|null:false|
|explanation|text|null:false|
|status|string|null:false|
|delivery_fee|string|null:false|
|shipping_area|string|null:false|
|shipping_day|integer|null:false|
|price|integer|null:false|
|user_id|reference|null:false,foreign_key:true|
|category_id|reference|null:false,foreign_key:true|
|brand_id|reference|foreign_key:true|
### Association
- belongs_to :user
- belongs_to :category
- has_many :images
- has_one :brand
- has_one :order

## imagesテーブル
|Column|Type|options|
|------|----|-------|
|image|string|null:false|
|product_id|reference|null:false,foreign_key:true|
### Association
- belongs_to :product

## brands
|Column|Type|options|
|------|----|-------|
|name|string|null:false|
### Association
- belongs_to :product

## categoriesテーブル
|Column|Type|options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|null:false|
### Association
- has_many :products
=======

## user_informationテーブル
|Column|Type|options|
|------|----|-------|
|post_code|string|null:false|
|prefectures|string|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building|string|ー|
|phone_number|string|null:false|
|user_id|reference|null:false,foreign_key:true|
### Association
- belongs_to :user

## creditcardテーブル
|Column|Type|options|
|------|----|-------|
|user_id|reference|null:false,foreign_key:true|
|customer_id|string|null:false|
|card_id|string|null:false|
### Association
- belongs_to :user

## addressテーブル
|Column|Type|options|
|------|----|-------|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|post_code|string|null:false|
|prefectures|string|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building|string||
|phone_number|string||
|user_id|reference|null:false,foreign_key:true|
### Association
- belongs_to :user

## ordersテーブル
|Column|Type|options|
|------|----|-------|
|product_id|reference|null:false,foreign_key:true|
|user_id|reference|null:false,foreign_key:true|
### Association
- belongs_to :user
- belongs_to :product

## productsテーブル
|Column|Type|options|
|------|----|-------|
|name|string|null:false|
|explanation|text|null:false|
|status|string|null:false|
|delivery_fee|string|null:false|
|shipping_area|string|null:false|
|shipping_day|integer|null:false|
|price|integer|null:false|
|user_id|reference|null:false,foreign_key:true|
|category_id|reference|null:false,foreign_key:true|
|brand_id|reference|foreign_key:true|
### Association
- belongs_to :user
- belongs_to :category
- has_many :images
- has_one :brand
- has_one :order

## imagesテーブル
|Column|Type|options|
|------|----|-------|
|image|string|null:false|
|product_id|reference|null:false,foreign_key:true|
### Association
- belongs_to :product

## brands
|Column|Type|options|
|------|----|-------|
|name|string|null:false|
### Association
- belongs_to :product

## categoriesテーブル
|Column|Type|options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|null:false|
### Association
- has_many :products









