class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]

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

  def my_bet(roulette)
    bets.where(roulette: roulette).first
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(
        email: data['email'],
        password: Devise.friendly_token[0,20]
       )
    end
    user
  end

end
