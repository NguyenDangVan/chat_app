class MessageRoom < ApplicationRecord
  after_create_commit {MessageBroadcastJob.perform_later(self)}
  belongs_to :user_room
end
