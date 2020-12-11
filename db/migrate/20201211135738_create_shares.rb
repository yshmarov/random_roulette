class CreateShares < ActiveRecord::Migration[6.0]
  def change
    create_table :shares do |t|
      t.integer :size, default: 0, null: false
      t.belongs_to :piggy_bank, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
