class User < ApplicationRecord
    has_secure_password

    has_many :comments
	has_many :likes
	has_many :videos
    has_many :playlists
    
    validates :name, :username, :password, :email, presence: true
    validates :username, :email, uniqueness: true
    validates :password, length: { minimum: 8 }
end
