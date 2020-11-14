class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_one :address
  # has_many :bought_products, foreign_key: "buyer_id", class_name: "Product"
  has_many :selling_products, foreign_key: "seller_id", class_name: "Product"

  validates :nickname, presence: true
  validates :first_name, :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください" }
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カナで入力してください" }
  validates :birthday, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 7 }
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  
end


