class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :message_rooms, dependent: :destroy
end
