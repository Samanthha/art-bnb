class Request < ApplicationRecord
  belongs_to :painting
  belongs_to :user
  validates :status, presence: :true

  def pending? 
    status == "Pending..."
  end

  def accepted?
    status == "Accepted"
  end

  def declined?
    status == "Declined"
  end
end
