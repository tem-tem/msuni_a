class CreateMsuPresentations < ActiveRecord::Migration[5.1]
  def change
    create_table :msu_presentations do |t|
      t.string :title
      t.boolean :visible
      t.references :msu_lecture, foreign_key: true

      t.timestamps
    end
  end
end
