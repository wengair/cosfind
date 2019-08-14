Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :characters, only: [:index, :show, :new, :create, :destroy]do
    resources :bookings , only: [:new, :create]
  end
  resources :bookings, only:[:index]
  resources :users, only:[:show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
