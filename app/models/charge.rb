class Charge < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}
end
