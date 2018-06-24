class CreateMsuUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :msu_users do |t|
      t.string :fullname
      t.string :email
      t.string :login_token
      t.datetime :token_generated_at

      t.timestamps
    end
    add_index :msu_users, :email, unique: true
  end
end
