class AddOrderToMsuLectures < ActiveRecord::Migration[5.1]
  def change
    add_column :msu_lectures, :order, :integer
  end
end
