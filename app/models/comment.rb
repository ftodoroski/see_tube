class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :video
    
    validates :content, :user_id, :video_id, presence: true 
    validates :content, length: { minimum: 1 } 
end
