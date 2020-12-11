class AddCountersToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :charges_count, :integer, default: 0, null: false
    add_column :users, :bets_count, :integer, default: 0, null: false
    add_column :users, :charges_sum, :integer, default: 0, null: false
    add_column :users, :bets_sum, :integer, default: 0, null: false
  end
end
