class Post < ApplicationRecord
  
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :notifications, dependent: :destroy

  belongs_to :user, optional: true
  has_and_belongs_to_many :tags

  has_one_attached :images

  validates :title, presence: true, length: { minimum: 1, maximum: 30 }
  validates :content, presence: true, length: { minimum: 1, maximum: 500 }

  def bookmarked?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  def get_image(width, height)
    images.variant(resize_to_limit: [width, height]).processed
  end

  def self.looks(word)
    Post.where("title LIKE ? OR content LIKE ?", "%#{word}%", "%#{word}%")
  end
end