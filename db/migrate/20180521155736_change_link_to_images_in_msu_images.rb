class ChangeLinkToImagesInMsuImages < ActiveRecord::Migration[5.1]
  def change
    remove_column :msu_images, :link
    add_column :msu_images, :images, :json
  end
end
