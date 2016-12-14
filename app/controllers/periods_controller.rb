class PeriodsController < ApplicationController
  protect_from_forgery
  def create
    # binding.pry
    @period = Period.new(period_params)
    @period.save
    @period.users << current_user
    render json: @period, status: 201
  end

  def show
    # binding.pry
    @period = Period.find(params[:id])
    @gift = Gift.new
    @comment = Comment.new
  end

  def index
    # binding.pry
    # @period = Period.new
    @periods = Period.all
    render json: @periods, status: 201
  end

  def destroy
    # binding.pry
    @period = Period.find(params[:id])


    @period.destroy

  end


  private

  def period_params
    params.require(:period).permit(:title, :expiration, :price_limit)
  end

end
