class Tag < ApplicationRecord
  has_and_belongs_to_many :posts
  
  validates :tag_name, presence: true, uniqueness: true, length: { minimum: 1,maximum: 100 }
  
  def self.looks(word)
    where("tag_name LIKE ?", "%#{word}%")
  end
end
