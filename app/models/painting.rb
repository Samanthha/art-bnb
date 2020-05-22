class Painting < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :photo, presence: true
  validates :name, presence: true
  validates :name, length: { maximum: 16 }
  validates :painter, presence: true
  validates :category, presence: true
  validates :location, presence: true
  validates :dimensions, presence: true
  validates :price_per_day, presence: true
end
