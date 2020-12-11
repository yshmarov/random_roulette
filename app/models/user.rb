class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :charges
  has_many :bets

  def to_s
    email
  end

  def update_balance
    update_column :charges_sum, (charges.map(&:amount).sum) 
    update_column :bets_sum, (bets.map(&:size).sum) 
    update_column :balance, (charges_sum - bets_sum) 
  end

  def amount_won
    balance - charges_sum
  end

end
