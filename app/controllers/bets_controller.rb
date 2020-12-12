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
        Roulette.create(shares_total: @roulette.shares_total)
      end

      redirect_to @bet.roulette, notice: "Bet was successfully created #{@roulette.shares_available}."
    else
      render :new
    end
  end

end
