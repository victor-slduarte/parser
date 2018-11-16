Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :angels

  resources :users, only: [:show] do
    get 'danger', on: :member
    get 'dashboard', on: :member
  end



  # get 'dashboard/:id' => 'users#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
