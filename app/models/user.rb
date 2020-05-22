class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :paintings, dependent: :destroy
  has_many :reviews
  has_many :requests, dependent: :destroy
  validates :first_name, length: { minimum: 3 }
  validates :last_name, length: { minimum: 3 }

  def name
    "#{first_name} #{last_name}"
  end
  
end
