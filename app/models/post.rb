class Post < ApplicationRecord
  
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  belongs_to :user
  
  has_one_attached :image
  
  # バリデーション
  with_options presence: true do
    validates :title
    validates :content
  end
  
  def bookmarked_by(user)
    bookmarks.exists?(user_id: user.id)
  end
end
