class Tag < ApplicationRecord
  has_many :posts
  
  validates :tag_name, presence: true, uniqueness: true, length: { minimum: 1,maximum: 15 }
end
