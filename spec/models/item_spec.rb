require 'rails_helper'

RSpec.describe Item, type: :model do
  context "Creating a new Item" do
    xit "creates a valid Item"

    xit "Fails to create a valid item if the price is too low"

    xit "Fails to create a valid item if the price is too high"

    xit "Fails to create if user doesn't exist"
  end

  context "New bid associated with item" do
    xit "Bid fails if bid price is less than curent highest bid or starting bid price"

    xit "Correctly pudate the highest bid price of item if bid is valid"
  end
end
