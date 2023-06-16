class AddBookmarkIdToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_reference :notifications, :bookmark, null: false, foreign_key: true
  end
end
