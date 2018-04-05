class CreateMsuBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :msu_books do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
