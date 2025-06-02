class AddUserIdToItem < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :user_id, :integer
  end
end
