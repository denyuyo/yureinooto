class Public::NotificationsController < ApplicationController
  
  def index
    @notifications = set_user.notifications
  end
end
