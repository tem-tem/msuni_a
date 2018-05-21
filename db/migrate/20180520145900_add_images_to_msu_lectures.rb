class AddImagesToMsuLectures < ActiveRecord::Migration[5.1]
  def change
    add_column :msu_lectures, :images, :json
  end
end
