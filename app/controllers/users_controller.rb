class UsersController < ApplicationController

  def index
    @users = User.all.order(shares_won: :desc)
  end
  
  def show
    @user = User.find(params[:id])
    @charges = @user.charges
    @bets = @user.bets
  end
  
end