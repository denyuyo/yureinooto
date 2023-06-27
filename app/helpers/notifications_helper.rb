module NotificationsHelper
  def unchecked_notifications
    if current_user
      current_user.passive_notifications.where(checked: false)
    else
      []
    end
  end
end
