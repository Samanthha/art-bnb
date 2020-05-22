class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :paintings, dependent: :destroy
  has_many :reviews
  has_many :requests, dependent: :destroy

  def name
    "#{first_name} #{last_name}"
  end
  
end
