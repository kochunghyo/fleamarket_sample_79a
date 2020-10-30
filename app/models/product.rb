class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  
  belongs_to :user
  belongs_to :category
  has_many :images
  has_one :brand
  belongs_to :brand

  
  

  validates :name, :explanation, :price, presence: true
  
end
