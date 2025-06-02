class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :bids

  validates :starting_bid, numericality: { in: 5.00..2_000_000.00 }

  def update_highest_bid(bid)
    self.update!(current_highest_bid: bid.price)
  end
end
