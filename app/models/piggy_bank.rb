class PiggyBank < ApplicationRecord

  has_many :shares

  scope :active, -> { where("shares_available > ?", 0) }
  scope :finished, -> { where(shares_available: 0) }

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
  
  def percent_left
    shares_taken.to_f/pool.to_f*100
  end
  
end
