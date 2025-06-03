require 'rails_helper'

RSpec.describe User, type: :model do
  before(:example) do
    @user = User.new(email: "camille@test.com", password: "foobar123_", password_confirmation: "foobar123_")
    @short_pass_user = User.new(email: "camille@test.com", password: "foobar12_", password_confirmation: "foobar12_")
    @no_num_pass_user = User.new(email: "camille@test.com", password: "foobarfoobar_", password_confirmation: "foobarfoobar_")
    @no_special_char_pass = User.new(email: "camille@test.com", password: "foobarfoobar", password_confirmation: "foobarfoobar")
    @duplicate_user = User.new(email: "camille@test.com", password: "foobar123_", password_confirmation: "foobar123_")

    @item = Item.create!(name: "Butterfly Knife", starting_bid: 100.00, user: @user)

    @bidding_user = User.create!(email: "camille2@test.com", password: "foobar123_", password_confirmation: "foobar123_")

    @bid = Bid.new(price: 150.0, user: @bidding_user, item: @item)
  end

  context "Creating a user" do
    it "Creates a valid user" do
      expect(@user.valid?).to be true
    end

    it "Fails if password is not long enough" do
      expect(@short_pass_user.valid?).to be false
    end

    it "Fails if password has no numbers" do
      expect(@no_num_pass_user.valid?).to be false
    end

    it "Fails if password has no special characers" do
      expect(@no_special_char_pass.valid?).to be false
    end

    it "Fails if email is not unique" do
      saved = @user.save
      expect(@duplicate_user.save).to be false
    end
  end

  context "Has a valid item attached" do
    it "Creates a valid Item association" do
      expect(@item.save).to be true
    end
  end

  context "Has a valid bid attached" do
    it "Creates a valid bid associaiton" do
      @item.save
      expect(@bid.save).to be true
    end
  end
end
