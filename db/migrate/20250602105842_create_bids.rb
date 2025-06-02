class CreateBids < ActiveRecord::Migration[8.0]
  def change
    create_table :bids do |t|
      t.float :price, default: 0.0
      t.datetime :time, default: Time.now.utc

      t.timestamps
    end
  end
end
