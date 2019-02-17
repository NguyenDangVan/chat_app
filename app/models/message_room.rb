class MessageRoom < ApplicationRecord
  belongs_to :user_room
  belongs_to :user
  belongs_to :room
end
