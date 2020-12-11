class RenameRoulettePoolToSharesTotal < ActiveRecord::Migration[6.0]
  def change
    rename_column :roulettes, :pool, :shares_total
  end
end
