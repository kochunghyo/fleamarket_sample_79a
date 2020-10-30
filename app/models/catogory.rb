class Catogory < ApplicationRecord
  has_many :products
  validates :name, ancestry, presence: true
end
