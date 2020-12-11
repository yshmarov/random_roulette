class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :charges

  def to_s
    email
  end

  def update_balance
    update_column :balance, charges.map(&:amount).sum
  end

end
