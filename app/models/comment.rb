class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  
  has_many :notifications, dependent: :destroy
  
  validates :content, presence: true, length: { minimum: 1,maximum: 500 }
  
  def create_notification_comment(visitor, post_id)
    user_id = Post.find(post_id).user.id
    save_notification_comment(visitor, post_id, user_id)
  end
  
  def save_notification_comment(visitor, post_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = visitor.active_notifications.new(
      post_id: post_id,
      comment_id: id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
