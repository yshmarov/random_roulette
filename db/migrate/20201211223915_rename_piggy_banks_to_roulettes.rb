class RenamePiggyBanksToRoulettes < ActiveRecord::Migration[6.0]
  def change
    rename_table :piggy_banks, :roulettes
    rename_column :shares, :piggy_bank_id, :roulette_id
  end
end
