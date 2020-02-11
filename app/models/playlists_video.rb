class PlaylistsVideo < ApplicationRecord
    belongs_to :playlist
	belongs_to :video

    validates :playlist_id, :video_id, presence: true
end
