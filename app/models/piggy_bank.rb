class PiggyBank < ApplicationRecord

  validates :pool, uniqueness: true, presence: true

  def to_s
    pool
  end
end
