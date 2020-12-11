class ChargesController < ApplicationController

  def index
    @charges = Charge.all
  end

  def new
    @charge = Charge.new
  end

  def create
    @charge = Charge.new(params.require(:charge).permit(:amount))
    @charge.user = current_user

    if @charge.save
      @charge.user.update_balance
      redirect_to charges_path, notice: 'Charge was successfully created.'
    else
      render :new
    end
  end

end
