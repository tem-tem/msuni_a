class ChangeFileToFileTypeInMsuFile < ActiveRecord::Migration[5.1]
  def change
    remove_column :msu_files, :type, :string
    add_column :msu_files, :filetype, :string
  end
end
