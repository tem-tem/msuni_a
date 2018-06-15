class AddPasswordDigestToMsuUser < ActiveRecord::Migration[5.1]
  def change
    add_column :msu_users, :password_digest, :string
  end
end
