class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.float :starting_bid, default: 0.0
      t.float :current_highest_bid, default: 0.0
      t.float :closing_bid, default: 0.0

      t.timestamps
    end
  end
end
