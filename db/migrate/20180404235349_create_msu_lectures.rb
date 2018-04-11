class CreateMsuLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :msu_lectures do |t|
      t.string :title
      t.text :content
      t.references :msu_discipline, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
