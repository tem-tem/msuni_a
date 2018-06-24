class ChangeTypeToFileType < ActiveRecord::Migration[5.1]
  def change
    remove_column :msu_images, :type
    add_column :msu_images, :filetype, :string
  end
end
