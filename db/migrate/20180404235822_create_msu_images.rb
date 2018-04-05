class CreateMsuImages < ActiveRecord::Migration[5.1]
  def change
    create_table :msu_images do |t|
      t.string :title
      t.string :link
      t.references :msu_lecture, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
