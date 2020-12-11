class CreatePiggyBanks < ActiveRecord::Migration[6.0]
  def change
    create_table :piggy_banks do |t|
      t.integer :pool

      t.timestamps
    end
  end
end
