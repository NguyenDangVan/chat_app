class TodoList < ApplicationRecord
  belongs_to :user_room
  belongs_to :room
  has_many :todo_items, dependent: :destroy

  validates :title, presence: true, length: {maximum: 50}
end
