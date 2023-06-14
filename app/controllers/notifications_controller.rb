class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @unchecked_notifications = @notifications.where(checked: false)

    @unchecked_notifications.each do |notification|
      notification.update(checked: true)
    end
  end
end
