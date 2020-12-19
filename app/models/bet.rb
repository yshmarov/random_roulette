class Bet < ApplicationRecord
  belongs_to :roulette, counter_cache: true
  belongs_to :user, counter_cache: true

  validates_uniqueness_of :user_id, scope: :roulette_id

  validates :weight, presence: true
  validates :weight, numericality: {greater_than: 0}

  validate :weight_smaller_or_equal_to_roulette_shares_available

  def weight_smaller_or_equal_to_roulette_shares_available
    if weight > roulette.shares_available
      errors.add(:weight, "can't be greater than shares available: #{roulette.shares_available}")
    end
  end

  validate :weight_smaller_or_equal_to_user_balance

  def weight_smaller_or_equal_to_user_balance
    if weight > user.balance
      errors.add(:weight, "can't be greater than your balance: #{user.balance}")
    end
  end

end
