class AddclosingtimetoItem < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :closing_time, :datetime, default: 1.day.from_now
  end
end
