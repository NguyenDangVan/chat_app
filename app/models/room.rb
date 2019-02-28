class Room < ApplicationRecord
  # after_create_commit :create_user_room

  has_many :users, through: :user_rooms
  has_many :user_rooms, dependent: :destroy
  has_many :message_rooms, through: :user_rooms

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 255}

  scope :order_name, ->{order name: :ASC}
  scope :groups_of_user, ->(id){where owner_id: id}
end
