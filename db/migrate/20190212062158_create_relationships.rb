class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :friend_id
      t.string :status_request
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :relationships, :friend_id
    add_index :relationships, [:friend_id, :user_id], unique: true
  end
end
