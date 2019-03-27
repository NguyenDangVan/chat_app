class AddColumnsToTodoList < ActiveRecord::Migration[5.0]
  def change
    add_column :todo_lists, :assignee_ids, :integer
    add_column :todo_lists, :due_date, :datetime
  end
end
