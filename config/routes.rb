Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users, :controllers => { :registrations => :registrations }
=======
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
>>>>>>> 70762c513ecfbb12a08d83389026a993ebb2a255

  root to: 'pages#home'

  # authenticated :user do
  #   root to:"user#dashboard"
  # end



  resources :users, only: [:show] do
    get 'danger', on: :member
    get 'map', on: :member
    resources :angels, only: [:new, :create, :update, :edit]
  end



  # get 'dashboard/:id' => 'users#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
