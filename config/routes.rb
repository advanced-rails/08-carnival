Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :cities

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
