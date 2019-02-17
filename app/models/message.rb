class Message < ApplicationRecord
  after_create_commit {MessageBroadcastJob.perform_later(self)}

  belongs_to :user

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

  scope :between, -> (user_id, recipient_id) do
    where(user_id: user_id, recipient_id: recipient_id).or(
      where(user_id: recipient_id, recipient_id: user_id)
    )
  end

  scope :exist_mess, -> (user_id) do
    where(user_id: user_id).or(
      where(recipient_id: user_id)
    )
  end
end
