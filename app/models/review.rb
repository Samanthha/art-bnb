class Review < ApplicationRecord
  belongs_to :painting
  belongs_to :user
  validates :content, presence: true
  validates :content, length: { minimum: 2 }
  validates :rating, presence: true
  validates :rating, numericality: { in: 0..5 }
  validates :content, length: { maximum: 100 }
end
