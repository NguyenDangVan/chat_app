class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: User.name

  enum status_request: {"Pending": 0, "Accepted": 1, "Blocked": 2}

  validates :friend_id, presence: true, uniqueness: {scope: :user}

  scope :your_friends, -> (user) do
    where(user_id: user.id).or(
      where(friend_id: user.id)
    )
  end
end
