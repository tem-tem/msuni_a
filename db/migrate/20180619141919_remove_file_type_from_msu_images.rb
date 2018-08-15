class RemoveFileTypeFromMsuImages < ActiveRecord::Migration[5.1]
  def change
    remove_column :msu_images, :filetype, :string
  end
end
