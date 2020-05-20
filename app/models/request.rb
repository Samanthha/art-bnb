class Request < ApplicationRecord
  belongs_to :painting
  belongs_to :user
  validates :status, presence: :true
end
