class AddPercentLeftToRoulette < ActiveRecord::Migration[6.0]
  def change
    add_column :roulettes, :percent_left, :integer, default: 0, null: false
  end
end
