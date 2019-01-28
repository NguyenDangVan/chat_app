class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  belongs_to :room
end
