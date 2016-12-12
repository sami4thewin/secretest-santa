class PeriodsController < ApplicationController

  def create
    # binding.pry
    @period = Period.new(period_params)
    @period.save
    @period.users << current_user
    render json: @period, status: 201
  end

  def show

    @period = Period.find(params[:id])
  end

  def index
    # binding.pry
    @periods = Period.all
  end


  private

  def period_params
    params.require(:period).permit(:title, :expiration, :price_limit)
  end

end
