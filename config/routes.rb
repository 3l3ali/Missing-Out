Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :posts
  resources :reviews

  mount Attachinary::Engine => "/attachinary"
end
