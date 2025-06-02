class AddUseridItemidToBid < ActiveRecord::Migration[8.0]
  def change
    add_column :bids, :user_id, :integer
    add_column :bids, :item_id, :integer
  end
end
