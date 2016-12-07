Rails.application.routes.draw do
  get 'static/home'
  root 'static#home'

  resources :periods

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :periods
  end

  resources :users do
    resources :gifts
  end

  resources :users do
    resources :comments
  end

end
