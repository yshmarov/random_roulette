class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :charges
  has_many :bets
  has_many :roulettes

  def to_s
    email.split(/@/).first
  end

  def update_balance
    update_column :shares_won, (roulettes.map(&:shares_total).sum) 
    update_column :charges_sum, (charges.map(&:amount).sum) 
    update_column :bets_sum, (bets.map(&:weight).sum) 
    update_column :balance, (charges_sum - bets_sum + shares_won) 
    update_column :leader_score, (shares_won - bets_sum) 
  end

  def amount_won
    balance - charges_sum
  end

end
