class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images
  has_one :brand
  has_one :order
  belongs_to :brand

  # belongs_to_active_hash :status
  # belongs_to_active_hash :delivery_fee
  # belongs_to_active_hash :shipping_area
  # belongs_to_active_hash :shipping_day
end
