class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  has_many :blocks
  has_many :friendship, foreign_key: :user_id, class_name: User
  has_many :rooms

  scope :select_by, -> {select :id, :name, :email}
end
