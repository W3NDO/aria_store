class AddUserNameToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :username, :string, null: false, default: ""
  end
end
