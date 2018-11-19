Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }

  root to: 'pages#home'

  # authenticated :user do
  #   root to:"user#dashboard"
  # end



  resources :users, only: [:show] do
    get 'danger', on: :member
    get 'map', on: :member
    resources :angels, only: [:new, :create, :edit]
  end



  # get 'dashboard/:id' => 'users#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
