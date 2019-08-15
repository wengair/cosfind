Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :characters, only: [:new]
  resources :characters, only: [:index, :show, :create, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings , only: [:index, :edit, :update]
  resources :users, only:[:show] do
    resources :characters, only: [:new]
  end
  get '/tagged', to: "characters#tagged", as: :tagged
end
