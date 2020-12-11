class SharesController < ApplicationController

  def index
    @shares = Share.all
  end

  def new
    @share = Share.new
  end

  def create
    @share = Share.new(params.require(:share).permit(:size, :piggy_bank_id))
    @share.user = current_user

    if @share.save
      @share.piggy_bank.update_available_shares
      @share.user.update_balance
      redirect_to @share.piggy_bank, notice: 'Share was successfully created.'
    else
      render :new
    end
  end

end
