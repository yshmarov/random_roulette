class PiggyBanksController < ApplicationController
  before_action :set_piggy_bank, only: [:show, :edit, :update, :destroy]

  # GET /piggy_banks
  # GET /piggy_banks.json
  def index
    @piggy_banks = PiggyBank.all
  end

  # GET /piggy_banks/1
  # GET /piggy_banks/1.json
  def show
  end

  # GET /piggy_banks/new
  def new
    @piggy_bank = PiggyBank.new
  end

  # GET /piggy_banks/1/edit
  def edit
  end

  # POST /piggy_banks
  # POST /piggy_banks.json
  def create
    @piggy_bank = PiggyBank.new(piggy_bank_params)

    respond_to do |format|
      if @piggy_bank.save
        format.html { redirect_to @piggy_bank, notice: 'Piggy bank was successfully created.' }
        format.json { render :show, status: :created, location: @piggy_bank }
      else
        format.html { render :new }
        format.json { render json: @piggy_bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /piggy_banks/1
  # PATCH/PUT /piggy_banks/1.json
  def update
    respond_to do |format|
      if @piggy_bank.update(piggy_bank_params)
        format.html { redirect_to @piggy_bank, notice: 'Piggy bank was successfully updated.' }
        format.json { render :show, status: :ok, location: @piggy_bank }
      else
        format.html { render :edit }
        format.json { render json: @piggy_bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /piggy_banks/1
  # DELETE /piggy_banks/1.json
  def destroy
    @piggy_bank.destroy
    respond_to do |format|
      format.html { redirect_to piggy_banks_url, notice: 'Piggy bank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piggy_bank
      @piggy_bank = PiggyBank.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def piggy_bank_params
      params.require(:piggy_bank).permit(:pool)
    end
end
