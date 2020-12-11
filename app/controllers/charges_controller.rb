class ChargesController < ApplicationController

  def index
    @charges = Charge.all
  end

  def new
    @charge = Charge.new
  end

  def create
    @charge = Charge.new(params.require(:charge).permit(:user_id, :amount))

    if @charge.save
      @user = User.find(@charge.user_id)
      @user.update_balance
      redirect_to charges_path, notice: 'Charge was successfully created.'
    else
      render :new
    end
  end

end
