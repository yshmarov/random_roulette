class RoulettesController < ApplicationController

  def active
    @roulettes = Roulette.active.order(shares_available: :asc)
    render "index"
  end

  def finished
    @roulettes = Roulette.finished.order(shares_available: :asc)
    render "index"
  end

  def show
    @roulette = Roulette.find(params[:id])
    @bets = @roulette.bets
  end

  def gamble
    @roulette = Roulette.find(params[:id])
    @bet = Bet.new(
    size: params[:size],
    roulette: @roulette,
    user: current_user
    )

    if @bet.save
      @bet.roulette.update_available_shares
      @bet.user.update_balance

      if @bet.roulette.shares_available.zero?
        # randomizer will be here
        weighted_random_winner = User.first
        @roulette.update(user: weighted_random_winner)
        
        weighted_random_winner.update_balance

        Roulette.create(shares_total: @roulette.shares_total)
      end

      redirect_to @bet.roulette, notice: "You've made a bet!"
    else
      render "bets/new"
    end
  end

end
