class Roulette < ApplicationRecord

  has_many :shares

  scope :active, -> { where("shares_available > ?", 0) }
  scope :finished, -> { where(shares_available: 0) }

  validates :shares_total, uniqueness: true, presence: true

  def to_s
    shares_total
  end

  after_create do 
    update_column :shares_available, shares_total
  end
  
  def update_available_shares
    update_column :shares_taken, shares.map(&:size).sum
    update_column :shares_available, (shares_total - shares_taken)
  end
  
  def percent_left
    shares_taken.to_f/shares_total.to_f*100
  end
  
end
