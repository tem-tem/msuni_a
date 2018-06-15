class DropMsuUser < ActiveRecord::Migration[5.1]
  def change
    drop_table :msu_users
    create_table :msu_users do |t|
      t.string :name
      t.string :password
      t.string :remember_digest
      t.boolean :admin

      t.timestamps
    end
    add_index :msu_users, :name, unique: true
  end
end
