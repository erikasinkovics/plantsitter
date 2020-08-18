Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users do
    resources :bookings, only: [:new, :create, :index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
