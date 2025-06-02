require 'rails_helper'

RSpec.describe Bid, type: :model do
  context "Create a valid bid" do
    xit "Fails if no user is associated with bid"

    xit "Fails if no item is associated with bid"

    xit "Fails if bid price is lower that item starting price or item's current highest bid"

    xit "Item owner should not be able to bid on their own item"

    xit "Bid fails if bid price is less than current highest bid or starting bid price" do
      expect(@bid.save).to be false
    end

    xit "Creates a valid bid"
  end
end
