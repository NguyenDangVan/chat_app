class ChangeDueDateToBeDateInTodoLists < ActiveRecord::Migration[5.0]
  def change
    change_column :todo_lists, :due_date, :date
  end
end
