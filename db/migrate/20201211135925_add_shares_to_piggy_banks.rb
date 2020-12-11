class AddSharesToPiggyBanks < ActiveRecord::Migration[6.0]
  def change
    add_column :piggy_banks, :shares_taken, :integer, default: 0, null: false
    add_column :piggy_banks, :shares_available, :integer, default: 0, null: false
  end
end
