class Painting < ApplicationRecord
  belongs_to :user
  has_many :requests
  has_many :reviews
  validates :name, presence: true
  validates :painter, presence: true
  validates :category, presence: true
  validates :location, presence: true
  validates :dimensions, presence: true
  validates :price_per_day, presence: true
end
