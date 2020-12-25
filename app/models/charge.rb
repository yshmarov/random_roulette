class Charge < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates :amount, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1000}
end
