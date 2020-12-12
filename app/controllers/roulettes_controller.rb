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

  def new
    @roulette = Roulette.new
  end

  def create
    @roulette = Roulette.new(params.require(:roulette).permit(:shares_total))

    if @roulette.save
      # @roulette.shares_available = @roulette.shares_total
      redirect_to @roulette, notice: 'Piggy bank was successfully created.'
    else
      render :new
    end
  end

end
