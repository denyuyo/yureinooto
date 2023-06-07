class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  # バリデーション
  with_options presence: true do
    validates :name
    validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
    validates :password
  end
  
  has_one_attached :profile_image
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.png'
  end
  def bookmarked_by(post)
    bookmarks.exists?(post_id: post.id)
  end
  
end
