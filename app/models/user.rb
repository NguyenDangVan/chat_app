class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :rooms

  scope :select_by, -> {select :id, :name, :email}
end
