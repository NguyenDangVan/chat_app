class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :title
      t.text :description
      t.string :avatar
      t.integer :admin_group

      t.timestamps
    end
  end
end
