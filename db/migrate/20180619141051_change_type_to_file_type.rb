class ChangeTypeToFileType < ActiveRecord::Migration[5.1]
  def change
    add_column :msu_images, :filetype, :string
  end
end
