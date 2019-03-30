class CreateTodoListsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_lists_users do |t|
      t.references :todo_list, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
