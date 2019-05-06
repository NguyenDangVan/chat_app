class TodoList < ApplicationRecord
  belongs_to :user_room
  belongs_to :room
  has_many :todo_items, dependent: :destroy
  has_and_belongs_to_many :users
  has_many :todo_lists_users

  validates :title, presence: true, length: {maximum: 50}
  validates :due_date, presence: true

  def complete?
    !completed_at.blank?
  end

  def complete_all?
    todo_items = self.todo_items.where(completed_at: nil)
    todo_items.blank?
  end

  def task_ass user
    return self if self.user_ids.include? user.id
  end

  class << self
    def task_assigne user
      TodoList.all.preload(:todo_lists_users).map do |todo_list|
        todo_list if todo_list.user_ids.include?(user.id)
      end.select {|t| t != nil}
    end

    def task_complete user
      TodoList.all.preload(:todo_lists_users).map do |todo_list|
        todo_list if todo_list.user_ids.include?(user.id)
      end.select {|t| t != nil}
    end
  end
end
