class CreateMsuFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :msu_files do |t|
      t.string :name
      t.string :type
      t.string :file
      t.string :link
      t.references :msu_discipline, foreign_key: true

      t.timestamps
    end
  end
end
