class Bookmark < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  
  def create_notification_bookmark(current_user)
    # 「ブックマーク」通知が既に存在するかどうかをチェック
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'bookmark'])
    # 通知レコードが存在しない場合のみ作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: post.id,
        visited_id: post.user_id,
        action: 'bookmark'
      )
      # 自分の投稿に対するブックマークの場合、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end
