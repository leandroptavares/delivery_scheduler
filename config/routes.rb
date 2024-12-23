Rails.application.routes.draw do
  root "deliveries#index"
  resources :deliveries, only: [:index, :create]
  get "/deliveries/total_cost", to: "deliveries#total_cost"
end
