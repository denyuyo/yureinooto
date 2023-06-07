class Post < ApplicationRecord
  
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  belongs_to :user, optional: true
  belongs_to :tag, optional: true
  
  has_many_attached :images
  
  validates :title, presence: true, length: { minimum: 1,maximum: 30 }
  validates :content, presence: true, length: { minimum: 1,maximum: 500 }
  
  def bookmarked_by(user)
    bookmarks.exists?(user_id: user.id)
  end
  
  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  def self.looks(word)
    Post.where("title LIKE? OR content LIKE?", "%#{word}%","%#{word}%")
  end
end
