class AddColumnAssigneeIdToTodoList < ActiveRecord::Migration[5.0]
  def change
    add_column :todo_lists, :assignee_id, :integer
  end
end
