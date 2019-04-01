class AddColumnCompletedAtToTodoList < ActiveRecord::Migration[5.0]
  def change
    add_column :todo_lists, :completed_at, :date
  end
end
