class BetsController < ApplicationController

  def new
    @roulette = Roulette.find(params[:roulette_id])
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(params.require(:bet).permit(:size))
    @roulette = Roulette.find(params[:roulette_id])
    @bet.roulette = @roulette
    @bet.user = current_user

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
      render :new
    end
  end

end
