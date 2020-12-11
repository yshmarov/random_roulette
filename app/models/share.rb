class Share < ApplicationRecord
  belongs_to :piggy_bank
  belongs_to :user

  validates :size, presence: true
  # size not more than piggy_bank.shares_available

  validate :size_smaller_or_equal_to_piggy_bank_shares_available

  
  def size_smaller_or_equal_to_piggy_bank_shares_available
    if size > piggy_bank.shares_available
      errors.add(:size, "can't be greater than shares available")
    end
  end


end
