class Request < ApplicationRecord
  belongs_to :painting
  belongs_to :user
  validates :start_date, presence: :true
  validates :end_date, presence: :true
end
