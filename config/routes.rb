Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :cities

  resources :reservations do
    collection do
      post '/select_cruise', to: 'reservations#select_cruise'
      post '/select_date', to: 'reservations#select_date'
    end
  end

  resources :cruises do
      member do
        patch '/add_date', to: 'cruises#add_date'
        patch '/add_city', to: 'cruises#add_city'
    end
  end

  resources :ships do
    resources :cabins
  end
end
