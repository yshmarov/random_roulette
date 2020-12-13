class AddRouletteWinDataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :roulettes_count, :integer, default: 0, null: false
    add_column :users, :shares_won, :integer, default: 0, null: false
  end
end
