class PeriodUsersController < ApplicationController

  protect_from_forgery

  def create
    # binding.pry
    @user = User.find(params[:user_id])
    @period = Period.find(params[:period_id])
    @period.users << @user
  end

end
