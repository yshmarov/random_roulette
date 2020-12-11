class PiggyBank < ApplicationRecord

  has_many :shares

  validates :pool, uniqueness: true, presence: true

  def to_s
    pool
  end

  after_create do 
    update_column :shares_available, pool

  end
  
  def update_available_shares
    update_column :shares_taken, shares.map(&:size).sum
    update_column :shares_available, (pool - shares_taken)
  end
  
end
