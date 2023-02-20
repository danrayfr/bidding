
class Product < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 80 }
  validates :description, presence: true
  validates :lowest_bid, presence: true
  validates :starting_bid, presence: true
  validates :bidding_expiration, presence: true
  
  default_scope -> { order(created_at: :desc)}
  
end
