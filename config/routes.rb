Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # get '/test', to: 'pages#test', as: :test
  get '/test' => redirect("http://192.168.15.170/"), :as => :test

  resources :angels

  get 'users/:id' => 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
