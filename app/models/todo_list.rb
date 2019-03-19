class TodoList < ApplicationRecord
  belongs_to :user_room
  has_many :todo_items
end
