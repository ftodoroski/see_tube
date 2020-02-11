class Playlist < ApplicationRecord
    belongs_to :user
	has_many :playlists_videos
	has_many :videos, through: :playlists_videos

	validates :name, :user_id, presence: true
	validates :name, length: { minimum: 1 } 
end
