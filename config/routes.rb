Rails.application.routes.draw do
  get 'users/update'

  get 'static/home'
  root 'static#home'

  # post 'users/:id', to: 'static#update'

  resources :period_users
  resources :votes
  resources :comments
  resources :gifts
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
