class PeriodUsersController < ApplicationController

  protect_from_forgery

  def create
    # binding.pry
    @user = User.find(params[:user_id])
    @period = Period.find(params[:period_id])
    @period.users << @user

    respond_to do |format|
      format.json { render json: @period }
    end
  end

end
