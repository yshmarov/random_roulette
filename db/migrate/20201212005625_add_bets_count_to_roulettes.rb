class AddBetsCountToRoulettes < ActiveRecord::Migration[6.0]
  def change
    add_column :roulettes, :bets_count, :integer, default: 0, null: false
  end
end
