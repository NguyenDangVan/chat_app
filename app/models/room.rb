class Room < ApplicationRecord
  belongs_to :user
  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms
  has_many :message_rooms, through: :user_rooms
end
