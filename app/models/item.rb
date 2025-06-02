class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :bids

  def update_highest_bid(bid)
    self.update!(current_highest_bid: bid.price)
  end
end
