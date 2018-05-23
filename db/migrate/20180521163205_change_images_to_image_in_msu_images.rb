class ChangeImagesToImageInMsuImages < ActiveRecord::Migration[5.1]
  def change
    remove_column :msu_images, :images
    add_column :msu_images, :image, :string
  end
end
