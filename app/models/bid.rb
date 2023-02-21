class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :bid_offer_amount, presence: true
end
