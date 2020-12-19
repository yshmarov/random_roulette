class RoulettesController < ApplicationController

  def active
    @roulettes = Roulette.active.order(shares_total: :asc)
    render "index"
  end

  def finished
    @roulettes = Roulette.finished.order(shares_total: :asc)
    render "index"
  end

  def show
    @roulette = Roulette.find(params[:id])
    @bets = @roulette.bets
  end

  def gamble
    @roulette = Roulette.find(params[:id])
    new_size = params[:size].to_i

    if new_size > @roulette.shares_available
      redirect_to root_path, alert: "There aren't so many shares left! Maximum #{@roulette.shares_available}"
    elsif new_size > current_user.balance
      redirect_to root_path, alert: "You don't have enough funds to make such this bet!"
    else
      # @bet = Bet.create(roulette: @roulette, user: current_user, size: new_size)
      @bet = Bet.new(size: new_size, roulette: @roulette, user: current_user)
      if @bet.save
        @bet.roulette.update_available_shares
        @bet.user.update_balance

        if @bet.roulette.shares_available.zero?
          # randomizer will be here
          weighted_random_winner = User.first
          @roulette.update(user: weighted_random_winner)
          weighted_random_winner.update_balance
          Roulette.create(shares_total: @roulette.shares_total)
          redirect_to @roulette, notice: "There's a winner!"
        else
          redirect_to root_path, notice: "You've made a bet!"
        end
      else
        redirect_to root_path, alert: "Something went wrong"
      end
    end
  end

end
