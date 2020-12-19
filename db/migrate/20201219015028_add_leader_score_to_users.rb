class AddLeaderScoreToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :leader_score, :integer, default: 0, null: false
  end
end
