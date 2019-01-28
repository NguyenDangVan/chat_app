class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :recipent_id, default: nil
      t.integer :sender_id
      # t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :conversations, :recipent_id
    add_index :conversations, :sender_id
    add_index :conversations, [:recipent_id, :sender_id], unique: true
  end
end
