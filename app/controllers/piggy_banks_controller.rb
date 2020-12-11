class PiggyBanksController < ApplicationController

  def active
    @piggy_banks = PiggyBank.active.order(shares_available: :asc)
    render "index"
  end

  def finished
    @piggy_banks = PiggyBank.finished.order(shares_available: :asc)
    render "index"
  end

  def show
    @piggy_bank = PiggyBank.find(params[:id])
    @shares = @piggy_bank.shares
  end

  def new
    @piggy_bank = PiggyBank.new
  end

  def create
    @piggy_bank = PiggyBank.new(params.require(:piggy_bank).permit(:pool))

    if @piggy_bank.save
      # @piggy_bank.shares_available = @piggy_bank.pool
      redirect_to @piggy_bank, notice: 'Piggy bank was successfully created.'
    else
      render :new
    end
  end

end
