class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  
  has_many :notifications, dependent: :destroy

  
  validates :content, presence: true, length: { minimum: 1,maximum: 500 }
  
end
