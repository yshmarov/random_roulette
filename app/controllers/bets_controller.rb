class BetsController < ApplicationController

  def new
    @roulette = Roulette.find(params[:roulette_id])
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(params.require(:bet).permit(:size))
    @roulette = Roulette.find(params[:roulette_id])
    @bet.roulette_id = @roulette.id
    @bet.user = current_user

    if @bet.save
      @bet.roulette.update_available_shares
      @bet.user.update_balance
      
      # BELOW NOT WORKING
      if @bet.roulette.shares_available == 0
        Roulette.create(pool: @bet.roulette.pool)
        # Roulette.create(pool: @roulette.pool)
      end
      redirect_to @bet.roulette, notice: 'Bet was successfully created.'
    else
      render :new
    end
  end

end
