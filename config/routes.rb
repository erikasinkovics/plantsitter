Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users do
    resources :bookings, only: [:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  get '/uikit', to: 'pages#design'
=======
  end
      resources :bookings, except: [:new]
>>>>>>> 84383970cb1f298ec32ab7e8fe9e7ffbbed133f8
end
