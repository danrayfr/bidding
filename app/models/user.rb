class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  enum :role, %i(bidder admin)

  has_many :products, dependent: :destroy
  has_many :bids, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}" 
  end
end
