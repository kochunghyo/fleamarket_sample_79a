class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :post_code, :city, :house_number, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
