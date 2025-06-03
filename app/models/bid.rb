class Bid < ApplicationRecord
    after_save :update_highest_bid
    before_save :validate_bid_price, :validate_bid_owner_diff_from_item_owner
    belongs_to :user
    belongs_to :item

    validates :price, numericality: { in: 4.00...2_000_000 }


    def update_highest_bid
        self.item.update_highest_bid(self)
    end

    def validate_bid_price
        item = Item.find(self.item_id)
        highest_bid = item.current_highest_bid || item.starting_bid
        throw :abort if self.price < highest_bid
        true
    end

    def validate_bid_owner_diff_from_item_owner
        throw :abort if self.item.user == self.user
        true
    end
end
