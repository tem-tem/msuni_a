class CreateDisc2s < ActiveRecord::Migration[5.1]
  def change
    create_table :disc2s do |t|
      t.string :user
      t.integer :user_fav_int

      t.timestamps
    end
  end
end
