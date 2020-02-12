class Video < ApplicationRecord
	has_one_attached :thumbnail
	has_one_attached :clip

    belongs_to :user 
	has_many :playlists_videos
	has_many :playlists, through: :playlists_videos

	validates :title, presence: true
	validates :title, length: { maximum: 70 }
	validates :title, length: { minimum: 1 }

	validates :description, presence: true
	validates :description, length: { maximum: 500 }
	validates :description, length: { minimum: 1 }

	validates :user_id, presence: true
end
