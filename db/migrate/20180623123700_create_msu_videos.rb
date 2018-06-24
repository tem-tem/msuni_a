class CreateMsuVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :msu_videos do |t|
      t.string :link
      t.string :title
      t.string :thumbnail
      t.string :description
      t.string :duration
      t.references :msu_discipline, foreign_key: true

      t.timestamps
    end
  end
end
