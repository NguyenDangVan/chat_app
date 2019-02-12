class Message < ApplicationRecord
  after_create_commit {MessageBroadcastJob.perform_later(self)}

  #belongs_to :conversation
  belongs_to :user
  belongs_to :room

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
