class Bid < ApplicationRecord
    after_save :update_highest_bid
    belongs_to :user
    belongs_to :item


    def update_highest_bid
        self.item.update_highest_bid(self)
    end
end
