class Notification < ApplicationRecord
  
  default_scope -> { order(created_at: :desc) }
  belongs_to :post, optional: true
  belongs_to :comment, optional: true
  belongs_to :bookmark, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
  
  def mark_as_read
    update(checked: true)
  end
  
  # 既読/未読のステータスを管理
  attribute :checked, :boolean, default: false
end
