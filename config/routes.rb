Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :destroy]

  resources :posts do
    resources :reviews, except: [:show]
  end

  mount Attachinary::Engine => "/attachinary"
end
