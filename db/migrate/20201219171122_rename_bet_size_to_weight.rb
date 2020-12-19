class RenameBetSizeToWeight < ActiveRecord::Migration[6.0]
  def change
    rename_column :bets, :size, :weight
  end
end
