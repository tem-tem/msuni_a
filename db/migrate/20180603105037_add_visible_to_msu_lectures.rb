class AddVisibleToMsuLectures < ActiveRecord::Migration[5.1]
  def change
    add_column :msu_lectures, :visible, :boolean, default: true
  end
end
