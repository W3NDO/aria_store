require 'rails_helper'

RSpec.describe Item, type: :model do
  before(:example) do
    @user = User.create!(email: "test@example.com", password: "foobar123_", password_confirmation: "foobar123_")

    @user2 = User.create!(email: "test2@example.com", password: "foobar123_", password_confirmation: "foobar123_")

    @item = Item.new(name: "Butterfly Knife", starting_bid: 100.00, user: @user)

    @price_too_low_item = Item.new(name: "Butterfly Knife", starting_bid: 4.99, user: @user)

    @price_too_high_item = Item.new(name: "Butterfly Knife", starting_bid: 100_000_000.00, user: @user)

    @non_persisted_user = User.new(email: "test2@example.com", password: "foobar123_", password_confirmation: "foobar123_")

    @no_user_item=Item.new(name: "Butterfly Knife", starting_bid: 100_000_000.00, user: @non_persisted_user)

    @persisted_item = Item.create!(name: "Butterfly Knife", starting_bid: 100.00, user: @user)

    @bid_updates_item = Bid.new(price: 200.00, user: @user2, item: @persisted_item)

    @bid = Bid.new(price: 200.00, user: @user2, item: @item)
  end

  context "Creating a new Item" do
    it "creates a valid Item" do
      expect(@item.save).to be true
    end

    it "Fails to create a valid item if the price is too low" do
      expect(@price_too_low_item.valid?).to be false
    end

    it "Fails to create a valid item if the price is too high" do
      expect(@price_too_high_item.valid?).to be false
    end

    it "Fails to create if user doesn't exist" do
     expect(@no_user_item.save).to be false
    end
  end

  context "New bid associated with item" do
    it "Correctly update the highest bid price of item if bid is valid" do
      expect(@bid_updates_item.save).to be true
      expect(@persisted_item.current_highest_bid).to eq 200.00
    end
  end
end
