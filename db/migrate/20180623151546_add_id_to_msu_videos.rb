class AddIdToMsuVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :msu_videos, :video_id, :string
  end
end
