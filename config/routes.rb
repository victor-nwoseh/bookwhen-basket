Rails.application.routes.draw do
  resources :basket_items, only: [ :create, :destroy ]
  resources :events, only: [ :index ]
  get "/basket", to: "baskets#show", as: :basket

  root to: "events#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
