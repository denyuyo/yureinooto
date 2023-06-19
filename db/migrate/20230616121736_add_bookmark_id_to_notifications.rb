class AddBookmarkIdToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :bookmark_id, :integer, null: false, default: 0
    add_index :notifications, :bookmark_id
  end
end
