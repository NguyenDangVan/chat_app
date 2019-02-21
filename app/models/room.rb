class Room < ApplicationRecord
  has_many :users, through: :user_rooms, class_name: User.name
  has_many :user_rooms, dependent: :destroy
  has_many :message_rooms, through: :user_rooms

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 255}
  #accepts_nested_attributes_for :user_rooms, allow_destroy: true
end
