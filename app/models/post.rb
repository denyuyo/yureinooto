class Post < ApplicationRecord
  
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :notifications, dependent: :destroy

  belongs_to :user, optional: true
  has_and_belongs_to_many :tags

  has_one_attached :image

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
  
  def create_notification_bookmark!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'bookmark'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'bookmark'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
  
  def create_notification_comment!(current_user, comment)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'comment'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'comment',
        comment_id: comment.id
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end