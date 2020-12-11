class SharesController < ApplicationController

  def index
    @shares = Share.all
  end

  def new
    @piggy_bank = PiggyBank.find(params[:piggy_bank_id])
    @share = Share.new
  end

  def create
    @share = Share.new(params.require(:share).permit(:size))
    @piggy_bank = PiggyBank.find(params[:piggy_bank_id])
    @share.piggy_bank_id = @piggy_bank.id
    @share.user = current_user

    if @share.save
      @share.piggy_bank.update_available_shares
      @share.user.update_balance
      
      # BELOW NOT WORKING
      if @share.piggy_bank.shares_available == 0
        PiggyBank.create(pool: @share.piggy_bank.pool)
        # PiggyBank.create(pool: @piggy_bank.pool)
      end
      redirect_to @share.piggy_bank, notice: 'Share was successfully created.'
    else
      render :new
    end
  end

end
