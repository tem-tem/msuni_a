class CreateMsuDisciplines < ActiveRecord::Migration[5.1]
  def change
    create_table :msu_disciplines do |t|
      t.string :title

      t.timestamps
    end
  end
end
