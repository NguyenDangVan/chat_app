class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages

  scope :select_by, -> {select :id, :name, :email}
end
