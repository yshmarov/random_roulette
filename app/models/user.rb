class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :charges
  has_many :shares

  def to_s
    email
  end

  def update_balance
    update_column :balance, (charges.map(&:amount).sum - shares.map(&:size).sum) 
  end

  def amount_won
    balance - charges.map(&:amount).sum
  end

end
