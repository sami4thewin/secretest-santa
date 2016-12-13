class UsersController < ApplicationController

  protect_from_forgery

  def update
    @user = current_user
    @user.name = params['user']['name']
    @user.profile = params['user']['profile']
    @user.save
    redirect_to '/'
    # binding.pry
  end

end
