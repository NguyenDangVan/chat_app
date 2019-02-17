class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :avatar
      t.string :password_digest
      t.string :remember_digest
      t.integer :gender, default: 0
      t.integer :role, default: 0
      t.date :birthday
      t.integer :status

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :email
  end
end
