Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :destroy]

  resources :posts do
    resources :reviews, except: [:show]
    resources :locations, only: [:new, :create, :edit, :update]
  end

  get '/dashboard', to: 'pages#dashboard'
  get '/home', to: 'pages#home'
  get '/index', to: 'pages#index'



  mount Attachinary::Engine => "/attachinary"
end
