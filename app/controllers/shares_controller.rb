class SharesController < ApplicationController

  def new
    @roulette = Roulette.find(params[:roulette_id])
    @share = Share.new
  end

  def create
    @share = Share.new(params.require(:share).permit(:size))
    @roulette = Roulette.find(params[:roulette_id])
    @share.roulette_id = @roulette.id
    @share.user = current_user

    if @share.save
      @share.roulette.update_available_shares
      @share.user.update_balance
      
      # BELOW NOT WORKING
      if @share.roulette.shares_available == 0
        Roulette.create(pool: @share.roulette.pool)
        # Roulette.create(pool: @roulette.pool)
      end
      redirect_to @share.roulette, notice: 'Share was successfully created.'
    else
      render :new
    end
  end

end
