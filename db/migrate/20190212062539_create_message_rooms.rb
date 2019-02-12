class CreateMessageRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :message_rooms do |t|
      t.string :content
      t.references :user_room, foreign_key: true

      t.timestamps
    end
  end
end
