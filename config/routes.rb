Rails.application.routes.draw do
  get 'favourites/add'

  get 'favourites/remove'

  get 'followings/create'

  get 'followings/destroy'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :destroy, :update] do
     get 'newg', to: 'users#new_guide', on: :member
  end

  resources :posts do
    resources :reviews, except: [:show]
  end

  get '/dashboard', to: 'pages#dashboard'
  get '/home', to: 'pages#home'
  get '/index', to: 'pages#index'


  mount Attachinary::Engine => "/attachinary"
end
