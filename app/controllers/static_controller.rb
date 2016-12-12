 class StaticController < ApplicationController


  def home
    # binding.pry
    # if !current_user
    @user = current_user
    # end
    @period = Period.new
  end




end
