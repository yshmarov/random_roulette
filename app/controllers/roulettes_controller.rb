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

end
