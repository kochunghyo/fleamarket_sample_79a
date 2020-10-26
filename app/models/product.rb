class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :brands
  has_one :order
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day

  valiidates :images, presence: true
  valiidates :name, presence: true, length: { maximum: 40 }
  valiidates :explanation, presence: true, length: { maximum: 1000 }
  valiidates :catgory_id, presence: true
  valiidates :status_id, presence: true
  valiidates :delivery_fee_id, presence: true
  valiidates :shipping_area_id, presence: true
  valiidates :shipping_day_id, presence: true
  valiidates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end
