class AddPathToMsuPresentations < ActiveRecord::Migration[5.1]
  def change
    add_column :msu_presentations, :path, :string
  end
end
