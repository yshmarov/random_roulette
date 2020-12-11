class PiggyBanksController < ApplicationController
  before_action :set_piggy_bank, only: [:show]

  def index
    @piggy_banks = PiggyBank.all
  end

  def show
  end

  def new
    @piggy_bank = PiggyBank.new
  end

  def create
    @piggy_bank = PiggyBank.new(piggy_bank_params)

    # @piggy_bank.shares_available = @piggy_bank.pool
    if @piggy_bank.save
      redirect_to @piggy_bank, notice: 'Piggy bank was successfully created.'
    else
      render :new
    end
  end

  private
    def set_piggy_bank
      @piggy_bank = PiggyBank.find(params[:id])
    end

    def piggy_bank_params
      params.require(:piggy_bank).permit(:pool)
    end
end
