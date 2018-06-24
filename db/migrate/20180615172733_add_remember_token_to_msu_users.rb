class AddRememberTokenToMsuUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :msu_users, :remember_token, :string
    add_column :msu_users, :name, :string
    add_column :msu_users, :password, :string
    add_column :msu_users, :admin, :boolean, default: false
    add_column :msu_users, :password_digest, :string
    remove_column :msu_users, :fullname
    remove_column :msu_users, :email
    remove_column :msu_users, :login_token
    remove_column :msu_users, :token_generated_at
  end
end
