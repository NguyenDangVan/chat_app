class Room < ApplicationRecord
  # after_create_commit :create_user_room

  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms
  has_many :todo_lists, dependent: :destroy
  has_many :message_rooms, through: :user_rooms

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 255}

  def owner?
    return if self.owner_id = current_user.id
  end

end
