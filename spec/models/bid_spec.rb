require 'rails_helper'

RSpec.describe Bid, type: :model do
  before(:example) do
    @user = User.create!(email: "test@example.com", password: "foobar123_", password_confirmation: "foobar123_")

    @user2 = User.create!(email: "test2@example.com", password: "foobar123_", password_confirmation: "foobar123_")

    @item = Item.create!(name: "Butterfly Knife", starting_bid: 100.00, user: @user)

    @bid = Bid.new(price: 101.00, item_id: @item.id, user: @user2)

    @item_owner_bid = Bid.new(price: 101.00, item_id: @item.id, user: @user)

    @no_user_bid = Bid.new(price: 200.0, item_id: @item.id)

    @no_item_bid = Bid.new(price: 100.00, user: @user)

    @too_high_bid = Bid.new(price: 100_000_000.0, item_id: @item.id, user: @user)

    @too_low_bid = Bid.new(price: 99.0, item_id: @item.id, user: @user)
  end

  context "Create a valid bid" do
    it "Fails if no user is associated with bid" do
      expect(@no_user_bid.valid?).to be false
    end

    it "Fails if no item is associated with bid" do
      expect(@no_item_bid.valid?).to be false
    end

    it "Fails if bid price is lower that item starting price or item's current highest bid" do
      expect(@too_high_bid.valid?).to be false
    end

    it "Item owner should not be able to bid on their own item" do
      expect(@item_owner_bid.save).to be false
    end

    it "Bid fails if bid price is less than current highest bid or starting bid price" do
      expect(@too_low_bid.save).to be false
    end

    it "Creates a valid bid" do
      expect(@bid.save).to be true
    end
  end
end
