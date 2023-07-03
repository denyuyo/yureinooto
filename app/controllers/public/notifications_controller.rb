class Public::NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.where(checked: false)
    @notifications.update(checked: true) # 未読の通知を既読に更新
  end

  def mark_as_read
    notification = current_user.notifications.find(params[:id])
    notification.update(checked: true)

    redirect_to notification.link
  end
end
