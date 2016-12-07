class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.name = request.env["omniauth.auth"]['info']['name']
    # binding.pry
    @user.profile = request.env["omniauth.auth"]['info']['image']
    sign_in_and_redirect @user
  end
end
