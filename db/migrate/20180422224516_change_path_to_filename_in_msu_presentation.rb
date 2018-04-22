class ChangePathToFilenameInMsuPresentation < ActiveRecord::Migration[5.1]
  def change
    rename_column :msu_presentations, :path, :filename
  end
end
