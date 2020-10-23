class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :first_name, :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角以外は入力できません'}
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナ以外は入力できません'}
  validates :birthday, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 7 }
  has_one :address
end
