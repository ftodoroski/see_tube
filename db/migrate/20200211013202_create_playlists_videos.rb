class CreatePlaylistsVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists_videos do |t|
      t.integer :playlist_id
      t.integer :video_id

      t.timestamps
    end
  end
end
