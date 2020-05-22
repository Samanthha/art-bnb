class Review < ApplicationRecord
  belongs_to :painting
  belongs_to :user
  validates :content, presence: true
  validates :content, length: { minimum: 10 }
  validates :rating, presence: true
  validates :rating, numericality: { in: 0..5 }
  validates :content, length: { minimum: 10 }
end
