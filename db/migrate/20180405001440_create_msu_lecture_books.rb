class CreateMsuLectureBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :msu_lecture_books do |t|
      t.references :msu_lectures, foreign_key: {on_delete: :cascade}
      t.references :msu_books, foreign_key: {on_delete: :cascade}


      t.timestamps
    end
  end
end
