class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: User.name

  enum status_request: {"Pending": 0, "Accepted": 1, "Blocked": 2}

  validates :friend_id, presence: true, uniqueness: {scope: :user}
end
